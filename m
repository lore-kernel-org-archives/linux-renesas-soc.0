Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61949EC5B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861707; cv=none; b=r0QR++CrpWbE80u5PWcHNrwSFfSQL6GUOMQ7xVgA4Hc+MkohnWYTAd4CVvF2z5UwT3XCpGLnN39YX0B95r3afqLdKCl1gaierh/8C2lAZetPgbkIzLfQs7k6Yaz3VxSspfTmrfkNk26gPK8ZtEF+KojQwiND0q+/O1dopcNdKMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861707; c=relaxed/simple;
	bh=7Fyxy571KMxMz2l9KXmc8erKfEp7VslXJ6d5gZZbnPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6s5XbFfZ2YfbSuUhs6ST50jN3XVOFsM/CNnLqi8VEcBM461C7ios29z8vEE1dtM7nwjoV45mM//1FCY2tMIXYaD5PtzShMcUt8jB6ycP8BycRDg3o8XX0NG7okYM6SV5y84hgtI3kwDZFkge90NgWLjeRcFaaqcVEiE+1YPBhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so1130044241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 03:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861705; x=1789466505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2tI/7x8c4NyE/PwWWec1lASAENg1AULIuOMZ9zg64C8=;
        b=lV1ULlTYtZoVYEntyWQfJDYTM3MTYIODjCSuuVkVk36xunqlo1iHLcMyC3yJY2oppt
         +dVPBXJrvaspqaX/JXHXmKLAPtjsGEY53Fgguor089cgkkkyO+ix55lGGybuFh2skuxD
         DpU1ITo+Bc5KoY2KiWFI5JPVld9U/fx4NslCUE8vT0jY0XS044IIc1/kZ82DcnFPC+F+
         33Md7BXqJ/TCKOA3aZsBV/JWWIu9+nxftzdT4GrKhJaH//VsAK1mobVzETm4RudcDWnY
         XmAl/VID+K56sEbTtwMwh+fHhSET3ktN5fqkMQAdxtNfHvlXSUf42ucg34F1xW31tk5K
         K4Lw==
X-Forwarded-Encrypted: i=1; AKwUvBy1HZVkD0rWAT7HQW9QpuH4szXEDv1rFMvkoneJE7no7XX96G/XypbNaAqIVn62FvFnRRy78+KczB2dKDDKKlZjJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kNUp0aLV8BQSguVrxPkV1KNT0l7c4wSnd5fsOlj7cx5SDOXqB9
	4E78t9KUvD7sL1Qk1PbXCs7RpQIISrcUP/byEqFYQuBMqRnpCCwd6ow7elpIlXpZ
X-Gm-Gg: AYBFou0XuPMbCsw5Kh98FPZSFyemhPBOYlZsE+ABNLuSkbnmaYRyZ1rHRNbHn+LxzN5
	p9kru1ZYVNtqw/0X932oupAkp1lkPBhUWQf6BzXnznGGHWBNhULfZv/+Hm2VsLZQBdsHEoWVybW
	wC0+s+oGt5KTDwoD5AI5JaLAUO5q3evwBIjWwdTHZaxIv21NtQRE+SjQf+0+anQZFZQEBb5PErw
	0ZIcyIe/7CRPby9jjzFv2jYQ8/5vlJv8DGMaAFuxftmYZ0FFhivlgydR4AMCChP+TScA5pW2ySc
	dJAQhLHzgmsw/srHgc4c7Ak7VAAcm+UCaN+rYkfdx2aoCcE6QOWhRAyIE3T4fNl7SbxYymFAXjt
	P5xPgKpVp3gB4hPhFfwIT9XUdV5/tB6v1tbDYqTxDoikBK4ldBWJUOPUMt41MpIVmvAZevGh1vL
	ro503hsclYBNILqT26o8Buwn+EPvcC7/Znun9kQvJsFsPMb4XGPu1sV8iSOX12RXXR9Xa6Nhxic
	Eu9lndLd99yn4YECkDH7wCdtc2u2uQ8yOxetgbWcQ==
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id ada2fe7eead31-78a4a91077bmr9480081137.9.1788861705338;
        Tue, 08 Sep 2026 03:01:45 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm8382123137.5.2026.09.08.03.01.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:01:45 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c67175d176so1979975e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 03:01:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAlGX9zVdXvFKonmd6enF9kiMtOlSRUo2I23zpGtWmBeVenGteKFdA1qSA1jcjlhy4npdMmPL+l9w1HNjOx8By+Q==@vger.kernel.org
X-Received: by 2002:a05:6102:6b01:b0:785:3211:f5e4 with SMTP id
 ada2fe7eead31-78a4a6c8a04mr9752098137.4.1788861704764; Tue, 08 Sep 2026
 03:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 12:01:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgPac64DF_MpVFioGJ2ef3irMB+_khaT32MgQS+UuCgQ@mail.gmail.com>
X-Gm-Features: AcwNN1XXZ_HyHzFSTOBPBh4qzYYojXkTSzZF4gN87445u1hVP8hGIVXwwu4oGIw
Message-ID: <CAMuHMdWgPac64DF_MpVFioGJ2ef3irMB+_khaT32MgQS+UuCgQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: renesas: rzt2h: remove unused struct rzt2h_pinctrl::gpio_range
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The struct rzt2h_pinctrl::gpio_range field is unused and seems to be a
> vestige of calling pinctrl_add_gpio_range(). Remove it.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
