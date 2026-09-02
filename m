Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E348947A89A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348972; cv=none; b=CnVHB4trd/RCx/9LkiP6TsXL5c6jP+nbKcoJqXx9JM5EbJATpTyDvNLLoMnKACPilJM/XiPkT/H/ex6mg6IR2irY4IZD4+QbUNlI3oAZiDc3pynoaFItsnuy+Q5eszyjoIlVQW49EW5EWSKt6j6/oVYhiQIhrackhiyCC5IAodw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348972; c=relaxed/simple;
	bh=wyPHokR3tqR3MR269liqtkoSqy7tkjxLQyug1Wc7V4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxFYXCwU3njE6E/T8w5YlayawS/XbBAixAOrxwWo2Q1k+WO/x8QgXnf4vEhDLr3TvNFsLKHWaTzmR0IoRfYNREw3H2mQ+klZYNw2oKFLtRFHJVAf8B7ZCwBK8vsKgccemVCHNZM8hoEmh25p1LuUv0iRO/yG3lBVY9aEEixLb3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97c940ef65cso483462241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 04:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348959; x=1788953759;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wG2vzYUiYB5Is79tPSwDBrckmDl3YMELkXESRZoQU1g=;
        b=bMDDm/YH27NPT5UD8/gH5Bg80I3V4WfhylR4sK9LO9xPMAQk6n0YbgVizBl/4/+Roh
         uxSJZPqZtqEh0VUJlk+tpubtPVrqr3D7Fy0xpNmRNG8fLD4el+BCVHk06QPhbhqDS8Mv
         l+Dp0b7XFqFkeqzawzmY51M2LI4MKhJ/0hiR1KR9pb5lYMpK5hp9WUArEhAvo3NBfEy4
         A8K8AUXfPTSvdqZ+Mw+XlazMpvsXmdUCQLcyp/jSsoqh3FHYgHj4kh7CN4/K+OVjr7pV
         jmo1s8V5bXVJyFXcNLeBU39kWjT9Qp7ga7wKsX8bw72KB3dYbFBkVmyXM/Il10nvWyxx
         vnwA==
X-Forwarded-Encrypted: i=1; AKwUvByYGr0WlcMS5y+PhT3qqLEuL2INl/r97uBoB+8xrP17oqxqUhOsOE01ogMHixWzOGCt/IZepAk7Iqzi8CvPzurK8w==@vger.kernel.org
X-Gm-Message-State: AFuF++nvMguGUdqYoNkwKZsZSwg5Fs2Y9QMwfeyOyB5OqY1u3bxsk6a3
	/3vclZfMp/wEVpk7a4fTE5HbyhDbvxZsxnaoCiKEeQ106VF7EqEqTbsu5H9T2cAu
X-Gm-Gg: AYBFou2QTVppUaZBKy6UYK5z7n3niB9jiOQ6oYQdrwnfn4Pw9dqr+GVMwIgEVVY2IaJ
	d1oFmc4H8TE1Xxb0066TE0vcjPAFE7GK6yuWa6DzFIhNAe8vcghi9OwwAqEP/kYRBnduIm2NRWd
	nu32xGQqbVpkJBFx2Pz594kJtjl/dr5L/DLbHU8qJRwAKSrYrlfhynDZS411o+ifgPztMox+9lR
	NSmsiSb8AeqFAeGFPpNk0dAVhbbtpisw+AfqdkXBzsO0jJSz2AtVJB8cr/1DkHxtAqAvItZ+y2j
	ydBSuLW8Nqv2M9n2+uDBwIXGb7cAxC7WXJD5rhDZ9CFmb8b1mFJIqF8/2sWtYMT8gqZ2xDadPPB
	zaiE503VV50JtTXbnF0I4ig41Cx1CCN7hWmVEFkMRqJqnhgD6wPi0fhu4oSBjkyI3TQOkjZoQqz
	H4meDbTQMPKC+7UW/zoaoy5hETcnsdBI28gmyuftK1nN78UseADtEoyz7kNXBMqoe5bcPdeejNJ
	9Gm5VTgu7nl7LEoDWD7CrpDn4Irjw==
X-Received: by 2002:a05:6102:3a0c:b0:789:3bbf:2dd7 with SMTP id ada2fe7eead31-78a1ef4aeebmr1526612137.0.1788348958657;
        Wed, 02 Sep 2026 04:35:58 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a251ca6sm1889818137.4.2026.09.02.04.35.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:35:58 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bf959b820cso945817e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 04:35:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxCCXBysolCNnQDA4b2+6GcZsxXIVd392zav9rY38DThO0neWB8IwqpCAL5iNZfaVG4eikFZNFiQYGf/C3no5b7Fg==@vger.kernel.org
X-Received: by 2002:a05:6122:489b:b0:5c7:98a9:cf95 with SMTP id
 71dfb90a1353d-5c7d27e3ce2mr1779605e0c.4.1788348958056; Wed, 02 Sep 2026
 04:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:35:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3POZVM4YmSN8r4rewPd9+GSnUvyL2F8oSqHzjk97Dbg@mail.gmail.com>
X-Gm-Features: AcwNN1UdAkMRtSpVoWeT4pt6w2QrIFGJ2Ah_h0QXalst1ZeOOfhDZh72790D8vw
Message-ID: <CAMuHMdU3POZVM4YmSN8r4rewPd9+GSnUvyL2F8oSqHzjk97Dbg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix GBETH TX scheduling policy for RZ/{V2H, V2N, G3E,
 T2H, N2H}
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Wed, 22 Jul 2026 at 10:54, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> This series switches the GBETH TX scheduling policy to
> Weighted-Round-Robin (WRR) on RZ/V2H, RZ/V2N, RZ/G3E, RZ/T2H and RZ/N2H
> SoCs.
>
> Since the GBETH nodes don't currently specify a TX scheduling policy,
> stmmac falls back to Strict Priority. In that configuration the highest
> priority queue gets all the traffic and starves the others under load.
>
> Under sustained UDP TX load with multiple data streams, this starvation
> triggers adapter resets due to TX queue timeouts:
>
>   iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
>   end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
>   end0: Reset adapter.
>
> Investigation showed that only the highest priority queue advances while
> the others stall for more than 5 seconds, causing the netdev watchdog
> reset.

FTR. fast-tracking to fixes for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
