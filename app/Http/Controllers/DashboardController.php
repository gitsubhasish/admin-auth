<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Auth;
use App\Models\User;



class DashboardController extends Controller
{
    /**
     * Display the user's profile form.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Inertia\Response
     */

    public function index(Request $request)
    {
        $users = User::all();
        return Inertia::render('Dashboard', ['users' => $users]);
    }


    public function edit(Request $request)
    {
        return Inertia::render('Profile/Edit', [
            'mustVerifyEmail' => $request->user() instanceof MustVerifyEmail,
            'status' => session('status'),
        ]);
    }

    /**
     * Update the user's profile information.
     *
     * @param  \App\Http\Requests\ProfileUpdateRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request){
        $user = Auth::user();
        $request->validate([
            'email' => 'required|email|unique:users,email,'.$user->id,
            'name' => 'required',
        ]);
        try{
            $input = $request->all();
            if($request->hasFile('image')){
                $file = $request->file('image');
                $filename = time() . '_' . $file->getClientOriginalName();
                $file->storeAs('public/uploads', $filename); 
                $request->user()->profile_image = $filename;
            }
            $user->update($input);
            return back()->with('message','Profile updated successfully.');
        }catch (\Exception $e) {
            return redirect()->back()->with('exception',$e->getMessage());
        }
        return Redirect::route('profile.edit');
    }

    /**
     * Delete the user's account.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        $request->validate([
            'password' => ['required', 'current-password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }


    public function changePassword(Request $request)
    {
        
        $request->validate([
            'current_password' => ['required','string','min:8'],
            'password' => ['required', 'string', 'min:8']
        ]);
        
        $currentPasswordStatus = Hash::check($request->current_password, auth()->user()->password);
        if($currentPasswordStatus){
            User::findOrFail(Auth::user()->id)->update([
                'password' => Hash::make($request->password),
            ]);
            return Redirect::route('profile.edit')->with('message', 'Password Changed Successfully');
        }else{
            return Redirect::route('profile.edit')->with('message', 'Oops! Something error happened');
        }
    }
}