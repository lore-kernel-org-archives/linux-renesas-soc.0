Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004130;
	b=SNIDhf5ltthcpfpvXSAmu8NbRy3YWsQwo8DZjBLdn9ry7PhdZkuTInngRydJ1Twgf3y3
	 DvcmlwSr6dRFiqodEx4jZBG46gWASooXfl5DDGczYz1znL9GpjYka7S1gUqLvq8Aiuo7q
	 bjXUJfGbelBo8vIVzsE3qbe6WR1vxfRsTmXUZYEY3XePwIdHiis+FIvU6s7rJnvNXzv5d
	 aNvZHnu52WlAOnP7f5+RRAHkaXS37u0TuMAQANkwsGcP+ABLqDQGuwRl9lFuG2cpepspd
	 zyzWcUdmlifGDrA0nJg1KtjnOK5Ao67tp/YxwVHRnTwdwNCaUTgwCU32++9p2Wci4Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004130;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=qzSDOlgy7IPmTrnuWw7M56rTWdyjH9dWqupudfVxyvk=;
	b=B67X1/t6ovJYHBOgg5EMPRXKQ5YZYa7rJfk4a1flBLMPI8XH3ym9qxkFhc25jHPWuSOn
	 0bX8yod1pgjMC9ArP2/sPcB1Q2mf8P6Q/G/JFaPl6ZDnQ72YQ60k3btAc3/NWNUpBtImY
	 ubgCzUSyF6V8rpyLDXqYiIAE/hR4puXvdrMZkE4l48mal9kwEBM9HG4CnDd8mi7eZ5N/h
	 zofkBn0sHqx9yxHCfd5lZp4YqRv/XuGXj66650HcYGuNoh4ueKO8oOhunmRGB9p8oJgkR
	 Yiq6PAo/PL6DbEozcY5Shs/jdX/OsdsE1OJ3hjvPwARYzt+PZaMRL0l6VHOCUssvTjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C1F606A31D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 08:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C1F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98ff53fb739so1721756241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 01:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004129; x=1793608929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qzSDOlgy7IPmTrnuWw7M56rTWdyjH9dWqupudfVxyvk=;
        b=n68GcU0cdcX4o0RM0kjDsrUKQWq1L0h36yp+V/G9reEo8ygjUPrW4T6UrFCxILI4Of
         EkV2NDzp82I74AGHK8YtCQW3NG8C7oC1oDBNQXpnplMpdpEk3MpOUR97L1/RkDqnI4vM
         9/3b6kP3Zwa8beqPp7kqxjFbZsMGLa+81DCkPx3MOQypOy59gS1GDypz4Ci8tCnMwNi/
         rjEPpCIf9VhSujYmCI5opt7EU7E1CKGzmI5iXyNEbFEVYzpPWbhbC3r1yylQthHohkwi
         yP1q10oGlqP6Ar8thVaDMJ6Vd2RR2cK+rBtnd9Q26cLPu3BfYLnaxxiUVZdfN/jwObZx
         N8wA==
X-Forwarded-Encrypted: i=1; AKwUvBzbcaShKwgaA4bv3e71j6N9taVK346DJY4MIgAd6BvPctQof7faKrKvueYT1zB7AeTHnZq6scdklD/3HON6nhaLDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLcex5loSwaQUWAbV7Mr89xqNvAyqfBK4pn4ZufVCZplEeSc7ad
	adXnJYXTwm62f5MB62+hKUHZJKTPwVeMK6Qu1cnF+og4afahTT4kv0BfP9ZOzNI8
X-Gm-Gg: AYBFou347qhwUobtOJKbw150Jm/OhC+96oeAWCn/dHMMd1Q7JqkMdfJ+qFydRbLyFgW
	nzcx0m07gtM1L+/Yl7MOAtRvIfysRASQD4lwv3vUCEl/pmjMFtZdNZ1s7xp51J3KzZ+sLqMxyBB
	Wz/zL+AccEAS9AeARgMYGDc9TXHMbw8i90a/lUtrze7k6jhu2se+Fkip0wl98aChMS6u3OW7LP0
	c/hFKMCb/YiNmoI5p9SIO3em2DH321JCzEUbOrUxWzq2gN/zh7X4niAkYb1qYUfHWEJUfVvb8tn
	Kk2zzBmQWBubsKN3Z1uOsoK+W5z25AGFXCIbg5OKFc0zmRhLmfZVkztBXQ1PrUced3yG+g6A3m7
	p1dxEfpzBGttaIWbZ/+9HRHGf0Cu2l3YcFwVskNtispZVbigTxF9/9HBf/jwO4qVlpWS88VNZNq
	tbFxX+KXqgkrrCqR0DwQaWTsrLhmHRsDQcgiWW55C5WZnOizwj/Gez301pBpdJNPm+y0QTL8P9t
	Xl/qksrY8sVNpok/JjRCXmGZCk756aOsX1T1lHFWUUtrNBp6kZFABoXOtdDbWzGqtusxyLTyA/x
	4+ROvz8jKlLH2SyO6Q==
X-Received: by 2002:a05:6102:5708:b0:7cc:1274:aba3 with SMTP id ada2fe7eead31-7ce5cdcf3b9mr1705399137.22.1793004129004;
        Mon, 26 Oct 2026 01:42:09 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e6cfb52sm7646643241.2.2026.10.26.01.42.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 01:42:08 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1724611241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 01:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxzxSh+A9prHtpo+/EhuWAj6WPfcNkvEnj3Zyu2rQh0R7qGdDTfdOnE+P3P/iEA4ouSMD844gVQT48XfIrx84t7JQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4b1b:b0:7c3:ac79:9b09 with SMTP id
 ada2fe7eead31-7ce5ce62789mr1802171137.30.1793004127932; Mon, 26 Oct 2026
 01:42:07 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017233416.47b09ffff48f.i2c-sh-mobile@gmail.com> <atvUWb-PzouZzL5D@zenone.zhora.eu>
In-Reply-To: <atvUWb-PzouZzL5D@zenone.zhora.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 09:41:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnJqADrLwGHdcdbAF7LTmcevhhXeuiDvThjjnnmdg-eg@mail.gmail.com>
X-Gm-Features: AclHuK-70od6XOcmvqKR7Sl7Q5xoAjafCFmOmm0SnnlxPySBXQ6b06PhHFeSvys
Message-ID: <CAMuHMdXnJqADrLwGHdcdbAF7LTmcevhhXeuiDvThjjnnmdg-eg@mail.gmail.com>
Subject: Re: [PATCH] i2c: sh_mobile: request IRQs after mapping registers
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Oct 2026 at 00:09, Andi Shyti <andi.shyti@kernel.org> wrote:
> On Sat, Oct 17, 2026 at 11:35:16PM -0400, Myeonghun Pak wrote:
> > The managed IRQ handlers are acquired before the managed register
> > mapping, so devres unmaps the registers before freeing the IRQs. A
> > transfer wakes its waiter before the ISR's final register read, and
> > unregistering the adapter does not synchronize these IRQs. An in-flight
> > handler can therefore still access the mapping when it is released
> > during driver detach.
> >
> > With forced-threaded IRQs, the handler can be preempted after waking the
> > transfer waiter and before its final ICSR read.
> >
> > Map the registers before requesting the IRQs so that managed cleanup
> > frees and synchronizes all handlers before unmapping their registers.
> > Keep IRQs available while unregistering the adapter because client
> > removal may perform transfers.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: 7fe8a9993337 ("i2c: sh_mobile: devm conversion, irq setup")
>
> Normally, I don't like taking fixes that don't address real
> issues, especially speculative AI-generated fixes.
>
> However, this looks like a harmless reordering that seems
> correct, although the issue it addresses is rather
> hypothetical.
>
> I'll remove the Fixes: tag, since this is purely speculative,
> and apply the patch to i2c/i2c.

FWIW, no issues seen when boot-testing several platforms using
this driver.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
