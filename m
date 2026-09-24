Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945AF48422B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255734; cv=none; b=XIQMeMF7WUukDsc5xdJtbmD/pSEv6z9ryZk72FeTRV8L4t51Z+EKfGFWGu87sJaXMD4gWaKgV0mfFNX6+PsJkzpeknhGnZ9OCLUaJilD7s6Sp7yylMAC+0bH8s4BocnosWaFThlIh7d53IbHueOdJuFJphPOcQ+3qda3OBWVv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255734; c=relaxed/simple;
	bh=D0eyAI1h/KCZFa6u0AMYu6XePMsP2evqWeGFla/gyQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyliri2O3xvk4McfH47GY66xErVFe7wCUo23/DZUeOEGVh7HW3b+EDN9wxHLDArEZe9rx6m3QNiJsQGUIivbRhsBctbDn9F+UMszseYcjXRyu7xyeb0snvvPyPohIrAUiA61SVFGVpTUNUMNqaXK36TZ66g+wfp1Ogyb4p4mLQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78a7003f94fso616392137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 06:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255731; x=1790860531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tsNuAVXeEfNNT1x1uW7zJgmNQEg5oMhegMPjI9srO0I=;
        b=R0G24eoqwwHyYGV5CI+3/8FGQ+qkzA/pKqN3qsWY5dRXWdecM8qq/BiN2Zu13pFt+u
         s4As5FHdGso99Bq5/Crnob1ZYsHKnxPkQ81jerXQ9IjEqm3M+V1B8N/eYKSU++tPjXEh
         0XWwS9xTTMp8pmYQ/PtCYT/sYxEuY8tf3yLR3+HzZjdnwPot0dDCjSauqau+0or63cvQ
         msWmh5RPN53xlW0tqZUkG41rnB59oQ+tIMjZrS8Rb/2+4WiTjHjJE48TvC+DP1ZwlNUz
         hqM4HGdoM0YjudJEo2cF8FuGhIDuou/BLboZGXWtK7CsDdLSjRTTuWKtYi68rlUypVi+
         PwrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX6Lu9lig6pII7y30V/GAlz4g+PR/zaf2gJDc2TLCZE8mWS/3H5WkVmnjrUm0esXOtQ/FXzNEj51mp3rjjgT+lDw==@vger.kernel.org
X-Gm-Message-State: AFuF++lr4xMc93TbISvZP2pqgrCTKI51YMBv48X1ShPXcJvG0KS5xDxk
	q/wggQf8cFQvSE5D511QVrdTLdazB5TEdyS0pSWIMPEVhOlV3miRCdgpo5gOYymd
X-Gm-Gg: AYBFou2FP2mAsmdtOyFCSXtoPYDuhUVhjVO7PqzkEWHSU4cr2iDcR/sb4aDZ2QN1AU+
	ftwM2rDekpoHskT+5UaZzojQE0yasPGz+QtggLyhi6C9HrwNC05KPYOtjE/1sHtNl1RpXdyyAON
	tLIYomP9NfQaGOYBUkRnU2R8no4Fw2kCBvbvkcqiDHBMutjkFKVEGGfMpReY4ZXCywyuTnx3xHi
	NetFoM9J+w34qQ9tUkhpqcaWTUwbNkbmrxYtSh6HVGZxB361488IYAxSEvdh89NX0t8OXDaVmFg
	x9Ip6e9FSnzoRRcFwiTW58PQUU51LTqEiqUNi3TGkTMjBSRZR8e59BMhHawEpl49UijtXy1WgKE
	HDYhQn7+d765C7ZwebfaEFRvELNI8xCn6dU1XjEFj9+qab1gKxx0TP9Z5XZP86Su8FBr0I3qWpT
	ZI/7UOhcBkEgF17yUM5WZV39HKWmzVopL/PmHMJs4zd9QkbuAqzfNSsGVS0M6wAFGBWwt829Icm
	j7Z7fGuLkpTeF8VCVx3s8/2nn6peK+bXHsP8Q==
X-Received: by 2002:a05:6102:5129:b0:7a7:196a:84e5 with SMTP id ada2fe7eead31-7af1ebf59e8mr1075818137.29.1790255731207;
        Thu, 24 Sep 2026 06:15:31 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5674f44sm6941071137.3.2026.09.24.06.15.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:15:30 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7dba0631so676632241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 06:15:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwMNJ8joW4CECn5S1lMxf41VhwKtIufAZmqYo1Iy/COVF1PvOVNDMP+qhMOkjA9s2zpj0OW+cqe1hPlGla2L8KVLg==@vger.kernel.org
X-Received: by 2002:a05:6102:f12:b0:7ab:d3f6:6225 with SMTP id
 ada2fe7eead31-7af19738629mr1145532137.0.1790255730386; Thu, 24 Sep 2026
 06:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924052741.130658-1-biju.das.jz@bp.renesas.com> <20260924052741.130658-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260924052741.130658-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 15:15:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVTyEROEciPgNuEjbnwEmm2+ah69x-aXEuhJxyn7Aq5Q@mail.gmail.com>
X-Gm-Features: AclHuK8LkE5uIDnRd3MFvv2wYdee95ICGlRvA17-gHv48WB3QWtPRG0tGQvnK-4
Message-ID: <CAMuHMdXVTyEROEciPgNuEjbnwEmm2+ah69x-aXEuhJxyn7Aq5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] can: rcar_canfd: Add support for Renesas RZ/G3L
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tu Nguyen <tu.nguyen.xg@renesas.com>, linux-can@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 24 Sept 2026 at 07:28, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for Renesas RZ/G3L CANFD IP. RZ/G3L has 3 channels and
> 11 interrupts, compared 2 channels and 8 interrupts on RZ/G3S.
> RZ/G3L has 288 buffers compared to 198 buffers on RZ/G3S.

Where do I find this "198"?
Table 30.1 "CAN-FD Specifications (1/2)":

    Total 192 buffers (when frame size is 76 bytes)

192 / 2 channels = 288 / 3 channels.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description
>  * Dropped RZ/G3S fallback

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
