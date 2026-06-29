Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E5E40911B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739478; cv=none; b=Np3F2HEtSzWr17sf0zmD+uU76zQsrBszQpwTuMoQjhzQKU654XuFebFW74ttKZcOgUzhJwOqbOIk9uRff3Nwwl1X81C8OnfbxGhYL6goHIy05gp1D0FZ1UXyoubv6ExorC4/orlsg294tphsr+ZVMn7R6KGd1UyqWjfJ5tNzFCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739478; c=relaxed/simple;
	bh=2F6Q+G8lPK3/LK966UnTL3MxjuHM04Y1nolQeR3CA4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9BFR6UiHclyxvIFPbRabtN0rKWptMNMsQYYPBZfRa8cAUOT5gpB9gQcqibdBP/nawYDDeTyKN3Wbfyf8vM0VfHTe3yigeWMzmioC+1ukajjYxOh8Usv3Iqw7VPuYYMKEgdvXIVtPLXsmgnzhiGMAMUKK5m+G/PGBMheG58ycys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9673385b1efso773505241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 06:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739477; x=1783344277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLPd0Ch+Wc2elcUwgdUQIz9nCCIE4WAtlCHUOVZvJQ4=;
        b=Ki1bLvWfoVPQ3t4un5rhIKgKcD9lAbfnoR2clhQjyPC7Qayxk2PEqGyYI+NpheS0Bp
         RiIWaGsX+GyKbRdRASwDxsAUfhtT5R1UBdiOug7H4SBZuhxrtera1rmSGU90ak1i1fio
         WY/NVYPE4UJ12rnJjQmrsYu5sGAyv8wOcIkcz/++UNvj8yC5cGKaDT9Rdhxc7tUFWiJN
         a8aSkFk1enzRSM/OiOYt2i262DbGcMo6kRXKNOPiDhHfDKcuU17yCeXWQicZAnPqj8m/
         4RV0ytWR5qWlvwXxmvUx5E7m2LnTt28LtxnGtnqyUkPn6ahRVLO9z8GvZ1xHdkO6ttWN
         gNIQ==
X-Gm-Message-State: AOJu0Yy49otmgR6A9HSI9TZGGpVohEF0Tn2jAP36GgnSpkRiQvulpX+l
	mLtodjT7hS8jNON31qS9DLY03zxWKRBMCFNTP0og/Bpv+2AwYehS9Y5Dn8/1vR4Q
X-Gm-Gg: AfdE7clI05y+Ixywggss7KkFcZX5UPk0jlp50N74rb+nr7VvEeVAiPsCfvgIbeVT+vU
	CoiUIqnMsdqqMFAEcg+rX2JpF9slG6ehRg7eA25hgS38kgCLdV3mnj+pz0Sn/uPLgvhV78HiXU6
	1h7Xyp8ftfWqgcQNbR/BMu6F8eaHqRHcVrtm9GB9b4DmUh3cKmwkAgy+hdMdubiAEzQuCG3+O3b
	wCrMCN7ddnrBok3Dp5zSJ1SvqOfVYbnRpl5yXYW+Mja+4YDjHVrB7iuWz35C5Y8P5L6VqqJo6QJ
	q+vuo35ultOky/Fqd2EikmG3NHXNU6EOlReQErvENhQKX47DKT4xkoOmdPnnK8T4AMJWVCcjP+p
	nm5szkIw+HbmmfLkUfC06GL6wiL7dPOITQRkp9HmNOYWu6xpR3DDQcVFgxYqDVSDHLOyFO47/9d
	vBJyEGKLBQr1ZeSYMA/Yi52mILkn0Y6iAQUOBEgD3u/3yPBG0b7FW2ASBoz9ud
X-Received: by 2002:a05:6102:5094:b0:73a:2195:4386 with SMTP id ada2fe7eead31-73a2195528fmr3515137.24.1782739476585;
        Mon, 29 Jun 2026 06:24:36 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-738f72b4cf2sm1230802137.7.2026.06.29.06.24.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:24:35 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso623839241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 06:24:33 -0700 (PDT)
X-Received: by 2002:a05:6102:f06:b0:650:94b2:3839 with SMTP id
 ada2fe7eead31-7343444e593mr6347265137.7.1782739473554; Mon, 29 Jun 2026
 06:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com> <20260626180326.9593-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260626180326.9593-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:24:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7E+8qOaB57HPV+bZsbKwjwMnKOKTgHXTP=37JnttDyQ@mail.gmail.com>
X-Gm-Features: AVVi8CfVKo8iwUjr1Vw7ce8j-4Mj2uWLtD2PeaR6Sv7OOxbw6WnrkVNuF-6CbEk
Message-ID: <CAMuHMdW7E+8qOaB57HPV+bZsbKwjwMnKOKTgHXTP=37JnttDyQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jun 2026 at 20:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Activate the FRAM and the SPI bus which it is attached to.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Change since v3:
> * none

Thanks, will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
