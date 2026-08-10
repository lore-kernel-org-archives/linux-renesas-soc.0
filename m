Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E723FE67B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373140; cv=none; b=pH99d9zZ3A7xY40NkFOaTZEFibR1i2FU/MSweegYxkmZXy3Y6kwiCf3ihIaIjV6jZJicHX7FbpO4OY6lrQLpXb7aFCzKkPG4pl2D6rbhWhjwvY9mxyT+ydZjaQ/48RGcFZn6mPAoX3XFnbUow66nDn36QC4aO1lWlW1tESwgXzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373140; c=relaxed/simple;
	bh=Bnwp9jqVKIAfs/y0mpNAldN8/vl6K6VBqOAFBG6md/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iL9dJFvmA9wKQXoBZbO+6gmULn8oZh5b8UNNoOLrEnr6lLoDIlQ/byBF/O2NXufxP1+WrFbKyryVGbS8YVxadzmXaaKrmdpwuyey1Mt5HZlv0pyT7YkLCiUhCvWrWhmIeFuM0/TaeXhTrcY6PkNGmmveDnAFdaRqeNEHb6bInZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-977fca41f52so682364241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373138; x=1786977938;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/J6pjqX1tkN7ol9r0yPzfB+nnpzebdTRaebsQQSoZo=;
        b=k6D0Y7QrVhG/wZBZIVOXuOgQSCKN5ydpETCnEVuc/FtF9uwTdMl5Gg8xLSu6EEjz6Y
         PQE3DH9OINqT/JS/9TEFLRziRVVYG5Ua6/XJHbnAUb1RhC55TrbvFLAYA9M997xQyhYE
         DNPjG7QBSNDm7jP6KEV6SZfCDUSsJCwxxQNyfOvBwjs4JvdlKSSfpfuRFTb5Q/QlmcEy
         UmVVXkOp/hFXNIFcB/jtcJ+Qz4TYeGX8Wyk1h5/8qtUdgci95PBdavjZpqlqf8aaOKt8
         3A+6XofighPbW928NpUNJXwamUH/Xx5AEtVCKAj0U2t72DEZZmyFUBdoM545xk3kiSAd
         ItbA==
X-Forwarded-Encrypted: i=1; AHgh+Royg0/CO9pYyFF5SGMEKc+FyTOtsZmyW2p/JAhGoR2Y6VFm8nwpjb8v2q4kS0cCWapUGFIVOJ9COYKWEBzDG3AZZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3QInPQHEft3R88fx5XNDGx4cMG6Xz4BwGtMiVhYHfU0Ws0Aa
	gRarM6wpl1qLUnM//wGS5/pGtHakZHRTHuIv4qWAEvyb0Ky8W5lT1FyOpscoMG1K
X-Gm-Gg: AR+sD111DyU+RLP07lhKLhhsOV9VeeZ6C7JgAZz2DqMIH3NnyZRcActPGwI2yeTsBIU
	SiGHl/OoBratZksdlA2zzK1rvMQbLqnLQeSGCJgvLUiOnHp8YSDhsgedQ0MwAyI09JJv+E7hZTB
	GK9cF4GFlql0NFcmNUi6fVZOLNiR6G6j54Px7raQVw1r4/L8cG6ee/JyJA+BALVp5q1zL8pdgtP
	4wWUYPYvop2k2J7R+uFN5QhR8dpzEuCm08y3xi3GuJqtZVZfayPRmbqxNe/pcskR4juhVdvrnOC
	yXxc3D/FWfk9b8ZTUKE11SrihpjpurI+yW7mh9g/G4vU9ZBAIZISaIxR0MqolXRfB6bUuWQVwtC
	fR3+0shP8homiHWz4WcrciXg8xEpw4r0/ljuszPWYB2JuSzOXgjzJorD9zSOh77akP3926Ky2IG
	Z1XG8GWhHSj7TyTRGWFzIJEp/ZsumzpENyuc0QM1odnJfRJHYcnYGIrl4T6ie6C7TtJ2+oSRYi6
	FAbBK6AY9tVMAtKpCGPCmFloQ==
X-Received: by 2002:a05:6102:3594:b0:631:7781:fe91 with SMTP id ada2fe7eead31-764e72c3161mr5670478137.9.1786373137646;
        Mon, 10 Aug 2026 07:45:37 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fe4daa5csm4719287137.1.2026.08.10.07.45.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:45:36 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-754acc61e10so830705137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:45:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoLs2rhvWgixzIYUoRf2RIN/HXCop5xiL99pD72HTjfco43iOo/i/CmzAydW/dek/hTz7smi3TjAeF8nJ0ArcYoXA==@vger.kernel.org
X-Received: by 2002:a05:6102:1490:b0:650:94b2:b209 with SMTP id
 ada2fe7eead31-764e5a4e354mr5957977137.4.1786373135792; Mon, 10 Aug 2026
 07:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org> <20260714130515.11262-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130515.11262-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:45:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZcy_kA-R=bjdDJQmPp--=NMuyaJB7NV-+uZ=zyFZ30Q@mail.gmail.com>
X-Gm-Features: AUfX_mzpflf907Mv9hDTB-ODXObAaiTjsgKM8flRS-o-ZchQdmzFsvncjRXxvD0
Message-ID: <CAMuHMdVZcy_kA-R=bjdDJQmPp--=NMuyaJB7NV-+uZ=zyFZ30Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: hihope-rzg2-ex: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The RTL8211E reference manual [1] page 38 chapter 7.16. PHY Reset
> (Hardware Reset) states that the PHYRSTB pin must be asserted low
> for at least 10ms (Tgap in Figure 10) and the system must wait at
> minimum 30ms (for internal circuits settle time) before accessing
> the PHY registers. Use 15ms and 35ms respectively to provide some
> additional margin.
>
> [1] https://files.pine64.org/doc/datasheet/pine64/rtl8211e%28g%29-vb%28vl%29-cg_datasheet_1.6.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
