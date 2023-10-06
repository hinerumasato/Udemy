package com.servlet.Udemy.models;

import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class GoogleTokenResponseModel {
    @SerializedName("access_token")
    private String accessToken;
    @SerializedName("expries_in")
    private int expiresIn;
    private String scope;
    @SerializedName("token_type")
    private String tokenType;
    @SerializedName("id_token")
    private String idToken;
}
