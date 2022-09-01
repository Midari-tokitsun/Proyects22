// Generated by view binder compiler. Do not edit!
package com.example.p3dispomov.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.viewbinding.ViewBinding;
import androidx.viewbinding.ViewBindings;
import com.example.p3dispomov.R;
import java.lang.NullPointerException;
import java.lang.Override;
import java.lang.String;

public final class ActivitySuperHeroDetailBinding implements ViewBinding {
  @NonNull
  private final ConstraintLayout rootView;

  @NonNull
  public final ImageView AvatarDetail;

  @NonNull
  public final TextView RealNameDetails;

  @NonNull
  public final TextView SuperHeroDetail;

  @NonNull
  public final TextView textView;

  @NonNull
  public final TextView textView4;

  private ActivitySuperHeroDetailBinding(@NonNull ConstraintLayout rootView,
      @NonNull ImageView AvatarDetail, @NonNull TextView RealNameDetails,
      @NonNull TextView SuperHeroDetail, @NonNull TextView textView, @NonNull TextView textView4) {
    this.rootView = rootView;
    this.AvatarDetail = AvatarDetail;
    this.RealNameDetails = RealNameDetails;
    this.SuperHeroDetail = SuperHeroDetail;
    this.textView = textView;
    this.textView4 = textView4;
  }

  @Override
  @NonNull
  public ConstraintLayout getRoot() {
    return rootView;
  }

  @NonNull
  public static ActivitySuperHeroDetailBinding inflate(@NonNull LayoutInflater inflater) {
    return inflate(inflater, null, false);
  }

  @NonNull
  public static ActivitySuperHeroDetailBinding inflate(@NonNull LayoutInflater inflater,
      @Nullable ViewGroup parent, boolean attachToParent) {
    View root = inflater.inflate(R.layout.activity_super_hero_detail, parent, false);
    if (attachToParent) {
      parent.addView(root);
    }
    return bind(root);
  }

  @NonNull
  public static ActivitySuperHeroDetailBinding bind(@NonNull View rootView) {
    // The body of this method is generated in a way you would not otherwise write.
    // This is done to optimize the compiled bytecode for size and performance.
    int id;
    missingId: {
      id = R.id.AvatarDetail;
      ImageView AvatarDetail = ViewBindings.findChildViewById(rootView, id);
      if (AvatarDetail == null) {
        break missingId;
      }

      id = R.id.RealNameDetails;
      TextView RealNameDetails = ViewBindings.findChildViewById(rootView, id);
      if (RealNameDetails == null) {
        break missingId;
      }

      id = R.id.SuperHeroDetail;
      TextView SuperHeroDetail = ViewBindings.findChildViewById(rootView, id);
      if (SuperHeroDetail == null) {
        break missingId;
      }

      id = R.id.textView;
      TextView textView = ViewBindings.findChildViewById(rootView, id);
      if (textView == null) {
        break missingId;
      }

      id = R.id.textView4;
      TextView textView4 = ViewBindings.findChildViewById(rootView, id);
      if (textView4 == null) {
        break missingId;
      }

      return new ActivitySuperHeroDetailBinding((ConstraintLayout) rootView, AvatarDetail,
          RealNameDetails, SuperHeroDetail, textView, textView4);
    }
    String missingId = rootView.getResources().getResourceName(id);
    throw new NullPointerException("Missing required view with ID: ".concat(missingId));
  }
}
