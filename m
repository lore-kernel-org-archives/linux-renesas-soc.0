Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B6F47126E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548372; cv=none; b=TNk9tnknhf01AfFBnUoA55ZYScn4lZoHVAxahSj0WPBlwT/mC4FoRDuCyO/4wE0/KW0fAtdepEs3slHdaBa53NvKxERaotiUHk6K6/j2izUbSwhzzRQxk79UkqWl5qONP5JN6B8dFPNOluOM6stNHH3K+SjcagwzIIk6p2PpGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548372; c=relaxed/simple;
	bh=fkgXul/nJOgkXGvFeDehAnwGgKSUSla8yTa1Z8/1Jpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCUhuaUSaUZPqe1bcYH19wKa+yCfIGJ+rTY4VaFfQcrrDJJWAlKoYEemfK0xC2uyFP4ISLpCXR+178aZYdFAzX4+4bQ7G5p9Adwqm0SHzj1HSjJoKo/YMlL81I7h1s+XJgiVc+3O7TBD5DbTX58KUf2CH9oNzXVF9vMDzkXfnzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bfaa014978so499695e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548364; x=1787153164;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=78VLJwlu5AYvqnqVZxumFMoCfA6OYUpYOq61FM+4USw=;
        b=kl4qRgK2VtrZGxOwV0/vczfMmGmOWPkP/gNyDjZ95+wRIvRaZmkAfX1EY1FLHe+P+f
         YZxolrmq1GDf8vRbCOd7eWT70O7XLhfeCyNEF9Sn+zrAExC9qpbPputp6TsLpQWhXsCS
         xO1DVlFWWRBT7XqoTI00AABmt6MghYjl9RXD9Ex2xlbD490Vf/zDFGY7tSEWfm1pkV0K
         BaXPSqh1WnBap9H71GVogYGx9K7EAmL1w53CWBJFxOabl56ptP2KkY0exI4k3YgMEb5Z
         L1lL79c6rVCMwvYmumKJ9pyUUe6dRYZy3686gAcStpHvprFwAm/e5id47iHwqlXxYHYC
         QDfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrX0wZ7SqDjnW1xtzjX/3hC9RAohjYrtJjSDXKeJMlMb66sZsW9PJuMjNaqDyd8VyJsweqj//BHNccKalSmCXzwFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiolYXdlFvyTUvHBgxFuhHTklQs0fPZbsHzCv3V1MEX1vEpeBh
	q+kaNd1fewJlS3r4SISjs9Ysz+J/I06hPKlzH9O/XHivVXLdnoRJHGb4bR4l2w1d
X-Gm-Gg: AR+sD11TrPQiZhiNp/OZch5qwbYTYk1Q00T7RjKpDffNVnCHxDRwMpSmH6GSupFq2mv
	inB4biCfubs9D31zaaxBF5oIu0hlHhm2u372DE4QuspO12p1CERK2VyYD81mJlDtpmXOBRQHc3A
	7JJ00mhN4Z/00g0slGRrth3gHZvExTJNXnblc0GMGiFAlnDoRqtxerqVZPUzbe1RZLzOGxsc5CR
	2et67FdcGCVwJ9K+cRnj+PphNSKYPNgiwsct1QqTpYY+h04AhI/cLOLhM/r46QP317uN13XAiIW
	Ktt36iq4pruHttTqLN0l1/P/5Q3uvHgbXfDFAecO5ZPm5OUQGi7teN5Vq+OWXPQeWwCCmf89OSD
	1GPJRQ8J8yF3y5TV72oKbQ+HlUoBgnkbRluywSF6j9u/lGZJXaA5RnvHdvXWXe7/jPnXoMhHiyQ
	EWmQ2aoYJrsU0sGc9jEafcTU4e0ZYj7tjzJY5RfvILvFw7rv0EK7p6aE+QkHLb6C64H7IZAqHgB
	5ZJOme13vNIsCSI/5p81JITzA==
X-Received: by 2002:a05:6122:488b:b0:5c1:706d:aec3 with SMTP id 71dfb90a1353d-5c501f69083mr619907e0c.11.1786548363470;
        Wed, 12 Aug 2026 08:26:03 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b12affesm1285986e0c.0.2026.08.12.08.26.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:26:01 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso294748241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:26:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpVEQSGS5MY0Vfxx/qUJM6PGAyIaPJ4mG8/W13DObuS1U7fwhncbFuCGq4MNcqGwOlOZUZyHUDPUI9Al8KxWV/rsA==@vger.kernel.org
X-Received: by 2002:a05:6102:faa:b0:73a:128b:ea07 with SMTP id
 ada2fe7eead31-76c8b1b2837mr1127524137.14.1786548360861; Wed, 12 Aug 2026
 08:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com> <20260722085353.136986-5-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-5-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:25:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQi0Otg0OQEq2KT+bTOx3bz-5S7aeYu8=QLaA9cEVzwg@mail.gmail.com>
X-Gm-Features: AUfX_mwE4ktTS5rxLf10ik_kUgMXbnGu-JrD24HfTOrwoPGW8DnsK9P-lfILEFc
Message-ID: <CAMuHMdXQi0Otg0OQEq2KT+bTOx3bz-5S7aeYu8=QLaA9cEVzwg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a09g077: Switch GBETH TX queue
 scheduling to WRR
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 10:55, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The GBETH ethernet nodes don't specify a TX scheduling policy, so stmmac
> falls back to Strict Priority. In this configuration the queue with the
> highest priority gets all the traffic, starving the others under load.
>
> Under sustained UDP TX load with multiple data streams, this starvation
> triggers spurious adapter resets due to TX queue timeouts:
>
>   iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
>   end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
>   end0: Reset adapter.
>
> Investigation shows that only the highest priority queue is advancing
> while the others stall for more than 5 seconds, causing a netdev watchdog
> reset.
>
> Switch the TX scheduling policy to Weighted-Round-Robin (WRR) so that
> traffic is processed across all queues, eliminating the stalls.
>
> Fixes: 394c1e24a4cf ("arm64: dts: renesas: r9a09g077: Add GMAC nodes")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
