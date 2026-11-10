Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794327592;
	b=gKrvhxxnEiwI3bLnQ77+miuCIAnhYWU8WWVzgS2le6s64DrOUZrLaIl/6q8/E+jLxdWN
	 5lbQKRAXz5/2pkHyw9/18f2W+CJUqow3jj17fZg/Aw584vKSETFGCVVQ1MrpJQrWDba+j
	 lvwsRX3CTn6Xj1nxD1sKOznLyDWbrTkXZ7F1OrJ6AL6u/t5H06Z9FZVMB4gG9RlH2wVyD
	 9XR5D3QxSAXqm3vlAzsb9oWCSANV4cFDO2Gc3nbF26+VtPHKH0aZpRxTEMJH8Yi5CiKyE
	 S0C5MbzInGMWgbxyMcnhsD8xQhhOhTwBRoAJIbAUpRv9rDNjKJQXOkABaFc+gPvsMmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qb2G21FlOrUfbYYuT8/0McH4jJCao8S8bFNKtNBwoNg=;
	b=1/XyBmO0k4CxSuii+/Yc04ZwmbmzA+608nsq8q7HIkl6G8bevwmqMHl0wUO5iOQpiaet
	 g5bmniqNy9xN6QIxl7U69AUJOer1uZt3fkGCv0jYouzztGA+C8Xi+S7532cNtKWx5ztcB
	 BSv/EGzVpfOmDavwgXMZeNVY9toH8Y7qaj1HD6/Tr7HxEvF8sX2NccNMfbHLRpZl+v9Ic
	 1MS4dY+jZKM7BYfUuJOIpQ3OuJmpjKP0xAhqeGRZqfY8U6P/mF9dvLJT0zeMaFAGCZk9A
	 AsadhYcEe9JwYFyo+XCmf4j1VhXRqq3/6lSZbeS2ub5B6D5hN8PpCgLQZGj8aiELQyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4XZ0qoc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C69606A32A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 16:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C69606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4XZ0qoc
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490585eddfcso1744210f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 08:19:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794327590; cv=none;
        d=google.com; s=arc-20260327;
        b=COpRIDgoiOui51lZUt/QjCUBVsXuKsPrkE/3OtrWoN038BVQNYxg4AkZMUYETyHvSw
         ulfFTJm8mpOiqmLmVBNjFLqKhYCco1lom5MK6sF0NWq7LKC+rTGMQ7jLHa3WvIeX7fRC
         ZiYx80XjYgAheD1RbOfAx4GqrGKpoTlzShIDPHF46d99q0MZ6P9F4FNrF0OO/CF90kbu
         9qFy74xGg7A64aHX58Q5QY//oB2rFcFzYDPJc502xy23HKQ2k4EmMKBC7VqNorOxO0R9
         kXWCQQFZd5cmcy+c9WkJoyrCwLgEMxro6paTHzMwZvMh+IVKqJ2S726chCsfuXym6/sl
         l1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qb2G21FlOrUfbYYuT8/0McH4jJCao8S8bFNKtNBwoNg=;
        fh=YYznoH44Gefq7pH/2zYpsrPbzmi8YVkmlWEpY+GfPUo=;
        b=KX9m4rhb4jeovY29YtsbG2d4tyH1Ad6MQxUZXgKGKxXq4gAA6Xis1KIs56A7LuEyDe
         vrcrEwUjHr2+n4MXHkbaMhishtOMdmT91U7VKA8P3y7GQpH4rlmHo9BPJtg9bH9Xyv48
         /0bqkGFLLo0Ln4yWGzfsxDz9tlYsDn1wFr6bELEZYRVRJXzgwYNEfTEAKstOa+qUw/Cv
         iRGxj2Ywp0E/nMudDRcyUmD+ZNuEbes7GkJLJZxCVufQEqnG6QyxtBx/b2TDi8zH/MTc
         Xzq/35WOG6bq7LXE3wAmqLOl0w3B+DG9RgSSFMghxMGnw0+flAtc46fFtXaSlLFNL9dG
         7CKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327590; x=1794932390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qb2G21FlOrUfbYYuT8/0McH4jJCao8S8bFNKtNBwoNg=;
        b=Z4XZ0qocZ96lpxd7Rb0ui1uFPo9ng20FkuyqlODIetmWhtNNqX68kxH/u14G2+tSPn
         3oBYCMCRaozcM7Cy1iPAjl8DJ6e2saSIp539Kv+qfR1OnJfX2dXSeqJNo6yydEzO6Y8Q
         oIs6L8H10+8DhzeUD+OedTs6d//Ox+ARVUZ2kB7y4/wXQPEmHU0nC7lrR/ElWo04ZPWl
         nlqmwMcOwgUaOT7r9dIb9C2WPT1g+tos6P+SdMSK+MIMqCLpDJEIvaqiH4AwDd7p1jSY
         jc0AnjU5JOFcK/bF7HDq5baAJppXK/xpMMvua96Hq3CaTd0xtmvtg61KD/yy+8WFQlCU
         0/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327590; x=1794932390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qb2G21FlOrUfbYYuT8/0McH4jJCao8S8bFNKtNBwoNg=;
        b=mLQG7c27Gg/I8bVxxuQbf9pRkFGvoqODxSzhv8J11I+dWrynrFx4Nq3Y8K37YNdvSG
         Clpk88oHdwmf8aBSIArDJeNx0leRNtWXOHfIGprWB22oS4NRdf/W3gDvAzZElUFVXVA+
         sYMo5L9P2Mx+4LCXMWhPpHd40LSzCB9UYPzHZj4p9gOJJi/kSyaBmKGY/6DIIM7alJBH
         WXC9sH/o3JI1adD7kFk9QrRHNFmyGIns2Rq/Zh9Y5OQPwY1OBycvRF0XS/TiEGLVyzdC
         AQFTmHanPFrgZDtisAQaOUfrI8VS9o0D6TltvsN+Y0cjiO+ttX/dC+miXDTiyY30niZM
         SKNQ==
X-Forwarded-Encrypted: i=1; AL+hErFRtVNe1KzLrAuybrZQJFjM2xnj7HTCGd2RT9V7gIg4X/QpDi+ejTP+tXMH1+abSHHRBHPve+njLdGYpzscNSedGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z81xcdK78md/jpK6mx7lGvMWsJIrLzg7Mw3AbNEnIzFw69DYZs5
	V9otamgCzB8ywycsHTGzDbJqPolbcMnm9ctlTslOamB5V6nZA8j898KUmEF8RLINwVAB51R8rM5
	15GiTTKd4PWq+MCybyGdHV38uLwUt6zA=
X-Gm-Gg: AYBFou3yM0NEbKMrHiAYtS9rD6atxdfUjYsRzHHc2EPVmb3nohWh/UFJJauQm/xyJ7B
	baxgsznk4ku4RAelHN698drATzm+vxghXKhjc6lMmXHwQ0yLk+4fRBejA1HQTVk6cLYEOG80n4N
	1mzTZZm9aBlpAI9AhAQ3FJ7W7pJvIdJZh6NZ3xiic+yvdmMPVBIyDiSeGDz8Ag7isRJw8lWuafn
	YuGVH93Tct40bP2gpbwIRYEvwZunCBA3xelXi3R8POvfNcoqmdZ3c8pod92/GDtI25igDuKGt+4
	Hc3thIQuXaQis2m3zHM2OVPAUZx7XJjv6LI9o3Y35TvME7GcYIcYlMx5zfAWmvsg/rwn9YYIzix
	BAPMcnTuvaYRCWPg/stOOZPhdpPKpF4JKmJftPP8GWVivSaW1lbgRoD2L2Sir62ezapL2qEEbv6
	NLoiY79gmmR7qvdItF5HlkHKa0+ZCQ3q/0K9EtFl50BdqXKJH6WyHV8FqibA==
X-Received: by 2002:a05:6000:2689:b0:492:20e0:f666 with SMTP id
 ffacd0b85a97d-49828b4d6a4mr6624888f8f.0.1794327590092; Tue, 10 Nov 2026
 08:19:50 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
 <CA+V-a8vtcZA_51PmDVWMKsOWaQB+CVDe=qh2FG=6iH2Rf2szVQ@mail.gmail.com> <a1bc40d2-f12c-4cd1-a4d8-c74e79606f39@oss.qualcomm.com>
In-Reply-To: <a1bc40d2-f12c-4cd1-a4d8-c74e79606f39@oss.qualcomm.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Nov 2026 16:19:21 +0000
X-Gm-Features: AclHuK9H7BCOsVyCiLXD4cG6ix6o20RW4-wpITBgbhIG6H4hpyEsxBCwGkTKdsU
Message-ID: <CA+V-a8stD4TFkrFHxddMLm+GPYReYAMcMdFsAC5zAKHPB8gV3g@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable the RZN1 RTC driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Nov 10, 2026 at 4:03=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 10/11/2026 16:57, Lad, Prabhakar wrote:
> > Hi Geert,
> >
> > Thank you for the review.
> >
> > On Tue, Nov 10, 2026 at 1:47=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> >>
> >> Hi Prabhakar,
> >>
> >> On Mon, 9 Nov 2026 at 12:41, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> >>>
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Enable the RZN1 RTC driver as a module. It is used by the Renesas
> >>> RZ/T2H and RZ/N2H SoCs.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>
> >> Thanks for your patch!
> >>
> >>> --- a/arch/arm64/configs/defconfig
> >>> +++ b/arch/arm64/configs/defconfig
> >>> @@ -1393,6 +1393,7 @@ CONFIG_RTC_DRV_TI_K3=3Dm
> >>>  CONFIG_RTC_DRV_RENESAS_RTCA3=3Dm
> >>>  CONFIG_RTC_DRV_MACSMC=3Dm
> >>>  CONFIG_RTC_DRV_S32G=3Dm
> >>> +CONFIG_RTC_DRV_RZN1=3Dm
> >>
> >> I don't know what happened here, but this is not the right location to
> >> add it? Moving between CONFIG_RTC_DRV_PL031=3Dy and CONFIG_RTC_DRV_SUN=
6I=3Dy
> >> while applying.
> >>
> > The configs weren't sorted, so I added it at the end. Thank you for
> > taking care of it.
>
> What do you mean? I just sorted it 6 months ago and it DOES look sorted.
> You just placed it randomly.
>
Sorry, my mistake. I assumed alphabetical order rather than
savedefconfig/Kconfig order.

Cheers,
Prabhakar

> Thanks Geert for fixing up the placement.
>
>
> Best regards,
> Krzysztof
