Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC74FC8F4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861888; cv=none; b=qifWxgxvIBQRlrGU5UExOj4aHWwZwXp80nA3VRmuZYAL42+bvaZCuNoC93HSpKeQ15krsA67szmhjhRp0yJuLtvlOO9l3eZMGx6tDgcAr+sS7OEblXtk1J7KXGqM64qZaXMLxZSDxLR4PSvN+n+LO+XPQWmKmmSnRYEoVYqseE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861888; c=relaxed/simple;
	bh=ghYsKIp07FN1l9ghsOylrYXrt4x8WJ0gtt+77NqonFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TU5IReUhaBaWzgL+sPKFImQZ//URB9Ro7c6jKTtawrhlxbBn7UnNeDu1VaHCGS/gNsh9rsQwM6/ksZNwkgpXzfNJ94+CKZhZOc3vUmnUbSuszYRNiWQjLe5w8ZlKrMDBRJTTLcfgn+xfJ7SSYcZw0qsi8nb1zC09msUeY26i6do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf9466867cso1856936e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 03:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861886; x=1789466686;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1LnrkgW+HhkF2YKwW0WsGcBJcvFVVqkAq4nhlk/AGHs=;
        b=fvDo5jh4sF/sa+203/aS09bdgSZHrfhsjxIflLcwAFwg9J8L1yHIedrwWO9KZCtymT
         IDjrk80DyKQ8DH4byxPtwokZk7DjgKXpf9fmzzPNTj7VcYY9lZzQTcSilaAeXbn9ppIn
         Ql6WlPIj1wDdp3sjOMtp7ldIBpnYMYjL85NQRGFZ6r0QU+6v2M8MkL9z8Yt4q0ubyO3L
         oAuilRFp1yJo2vM/PQwQeaV+o8rkeqVqAiNBPwMLPhx54tqyyMOiGBx6J35SUadXjs1t
         3FMEOfeRNvxdPPP2kDFt40WM1SU6c1Ns7SzgWEN31fwPUKcB6akitrT9WUttjyD6rJW5
         Yz+w==
X-Forwarded-Encrypted: i=1; AKwUvBwavnbhYWefsW4WiVceN1zTwKflmPB73Mw5EdrEtnDCjIqUg1MATQrkFsPpihro9H4MuFL9RmCQFCNItsKNKX+phQ==@vger.kernel.org
X-Gm-Message-State: AFuF++moD580K1CsmppMvzkKzc+Mb6duuAFMSCCXB7rlBA9H7gH0m+fI
	hK2gQO6IS4HoMPTw+soe4uoc0913KRhHcQ2Hyqt0irs5CwKkNrTat+AJBY7HPUVC
X-Gm-Gg: AYBFou0ead3rz8LUWg0Wq2/5bztYiLUMQjVgOz7cPObENT9coccgpMTRJIjJi3TBiMA
	NLB6GCzxOc+1+Wq5PoxFKYFPQxs5g+m01ilzN63aN7whsHT8gq8lC/cub+u3m0w8JBK9KIDerFg
	CtFmqddee7T3BoImg/6pHHfYBmNyu0TmPArZ5qGIn+h3es0ONf1EKBIc9Kq6POr/xLAJCdywmQx
	2byd6GkAIAVGaAg3WseQXzzKPff9GI8OlTsteQYySGsXzVpDd8uvL5VHdfjZks6Sj7QJFq+NKGm
	3dt3j0g1AtpsOLgtWuSvs1PPEeH0alqV7M7mCjsIhEx0Is/CuAhX8834BvduhdEsXsWTIZpAWNP
	e92tKgT6z+0KrrwFyi+/mSsLwrTibrhBUUA29sEGgcmPzZ43+vsmy1IJ38h1K6MvE+YcB7QBBxR
	h+7tPTVRwIGDC7AuXk2udHszrJBfHBwNfWk+voIP9ne8dBhbOchk/gQImQYpn89WxSZGre2f/wA
	dLaghbq8+MqFdm7uUjU6YseYg==
X-Received: by 2002:a05:6102:943:b0:77a:d089:3dd8 with SMTP id ada2fe7eead31-78a4aa5a199mr8952523137.12.1788861886218;
        Tue, 08 Sep 2026 03:04:46 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b19369sm8428116137.9.2026.09.08.03.04.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:04:45 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-782c22fbb1cso1247711137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 03:04:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzH6ODmzqCwiQdgBeXTxvNWhaJF+RsC5p0RqFVwgmZBj2KkLx1Mf6+WuksZlJZn9dKXx6d2WGVvJyql3LyG4Sqgfg==@vger.kernel.org
X-Received: by 2002:a05:6102:943:b0:77a:d089:3dd8 with SMTP id
 ada2fe7eead31-78a4aa5a199mr8952340137.12.1788861880753; Tue, 08 Sep 2026
 03:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-8-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-8-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 12:04:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6etGuJC5Kg2S0fZGO=gq4HPHVtN2MzfxKTdMVTKsJCQ@mail.gmail.com>
X-Gm-Features: AcwNN1X3RV4SYt13JI31j2zWzRybiv-rSaAkaCpsuF4HrMpzBo7HJkyDeoSaj10
Message-ID: <CAMuHMdV6etGuJC5Kg2S0fZGO=gq4HPHVtN2MzfxKTdMVTKsJCQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] pinctrl: renesas: rzt2h: reuse helpers
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The PMCm peripheral-mode test, the PFCm function read, the PINm input
> read, the PMm write, and the PMm read are open-coded in several places.
>
> Reuse the already existing helpers.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
