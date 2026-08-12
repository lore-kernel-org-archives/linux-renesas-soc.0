Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05943B6D2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548318; cv=none; b=Kbfth3HLilmQ5hxzoCC6n63J+V8ZGIAaYYOiu9pFYFRis8NMZiKOjWrreCwdhZL2M29Dsryb3iiyUJd074gBTKQtG3/BG4jxGjMjDjVWy0KluBsKtYq4bc1sYnYxzcO3bg13H3PAlvGjS5I1TcHtzM/YkZHqNyDnmYc0P836sa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548318; c=relaxed/simple;
	bh=wBc/mEpxPWYG6kKYKrzng8yxGAJWiheWEr/si2zaq10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7900ROjMWtVIgMSBsuyY+TNuQO0aKt0GdRR7sx/zBGNC0nENHfN+I0rc1vRdFYNHo5wyZJI3yRJffEPAjyutLxkJ2G99YkzmscVCQ16E+yR5okB4cTr11OGx4F30nTosxzzd/ceqVVM7WNPLFk+tSCmarg71oibLz89jbrhKJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-969524c1a63so720080241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548315; x=1787153115;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L7MNCSv1Z1lagRcn5uepDfo8EwiNqq40oRyB9RhTSh8=;
        b=OrriqD27fXCGhdXQkkcopsm8lK/NwhOmWbQuFLEzrj65yyDLIZ+8HrmIB8c1OlccGh
         fqsASaBK492Jf48ojptShrKRR/QtvIwrDSDPNw79zay0awcHDHZHy6eHkZh6I3x3t81K
         17NyGmRdng/Ej5GBc0SxWvoyPg+iCUvHGDufiZK69VHGE+sjIfdP6D5N7nZF6iOU05y9
         i8JvHwUoXmmhF336Eqt+cDtQGEg5rtDGWMjyhK0JVDD1AMyTK1Nw6aoYhvKJYIEXfGJi
         dB53stk5RueY3xgJzjTgAG9J61orhMMXSsGXKAP4AVvAU9q7H6aFf4q5uqzMK71mAgyc
         nNEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rot1Yp+OG7gl+ARIB4YR2mBRfLnFVGoFA1wYidhgY2FGcrZ7NAcCcrnsm27SG9qCjpaMX5GPpWjYht8/bvfOOcskw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKnAT6bpmpnNgD53FFIPPdYuPUTyUqiAtZaK2Q2V899tjOTAL
	PkKOU87PeJJjVlp8XWZZYngPgMD4FZQqHroujzbdpX+iUa6tmdnrTMwpL94cIfYt
X-Gm-Gg: AR+sD12jWRFNgJQo6n5CXHEyeiwugliWU7O93RWGESF4BJVx5odMbFdAxqKJq2S6507
	ym7MNsZRZt0J+b3SITkKgTMkO1huAeFOhchrtnL74aw6JwHxvERq0+VJzpjGnzSphBPyVQEIkt5
	AQec0JOeY2UNZ5zoGubtPbZcRahsJeelfw6aKBhkZTpgdEbVucMBbs4GJZZxEoWwBDPRQ95Lv/s
	qnrFnWlcKcFSImODNe4Bk9GaLkp3MLo9jHM2Is7/+GjU8zSm9mB5T98D0wAGJHLUzj7Kkv0Hiqh
	77RkLpcHqSFEKfyfvvtw/L3LJ7egTdvDmP/BzSsWCFdyyNROAURxoINWcMUY/U50/aqpIRgaGWM
	rY2dIt5pLciC9wEwzPUVXqilJyk4uJYqnTd+HAn5Vv5IXND7+M06DdT/+AucpUDs1UVC5KMb7KK
	dh9UEFzoyxWdVKTkjj15HMIZZ07Zbu0lOowOPwCtkx2MpxdMMwAXxJJumpMt9mfCr2HpZqbAt/Z
	ttjXok7WwmH6BpqKkmK0J+NFw==
X-Received: by 2002:a05:6102:f85:b0:739:15ef:cdfb with SMTP id ada2fe7eead31-76c88761787mr1588021137.5.1786548313209;
        Wed, 12 Aug 2026 08:25:13 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76caf096b3csm828031137.1.2026.08.12.08.25.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:25:12 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-977fca41f52so503214241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:25:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoJDfLJap1EtWjYf/m5mfUzp/CqEKKtgndHzjT5npw3qexVuSlVN4zwV/2J0DYiE432mM79xJGjumxj62Xnmy86Bg==@vger.kernel.org
X-Received: by 2002:a05:6102:4bc3:b0:744:d1a6:b11d with SMTP id
 ada2fe7eead31-76c87d7047bmr1726050137.3.1786548312284; Wed, 12 Aug 2026
 08:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com> <20260722085353.136986-6-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-6-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:25:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNEGGcuSVmz9-fBkOWp0UJm0raJQXFDMvC0QqTMGUQNg@mail.gmail.com>
X-Gm-Features: AUfX_mz589fDdhEdLZrgWxwyCDpICS4I5MWqxVROEDzOMJyl2oP-WDthInu7QVw
Message-ID: <CAMuHMdVNEGGcuSVmz9-fBkOWp0UJm0raJQXFDMvC0QqTMGUQNg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a09g078: Switch GBETH TX queue
 scheduling to WRR
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

Thanks for your patch!

s/078/087/

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
> Fixes: c4698a34993b ("arm64: dts: renesas: r9a09g087: Add GMAC nodes")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the SoC part number fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
