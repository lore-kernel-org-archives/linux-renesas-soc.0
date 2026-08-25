Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C0346C85B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664025; cv=none; b=kQcWVhmw3e8s0QjjqxAe0+0K9nIjTE/usEr3EseaSV0ISV9RWufbnsz27B5VoQxUEChb5PSvVPLh5kSXpGNA9Y9ka6KtiXRAdQ0dJychFLJrNGJXHe9wcIBPsAEOryYlSk2npCG9MMQ4Om2IcxyHvF8k2Xx7TtxlvidowqfLSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664025; c=relaxed/simple;
	bh=PmRTs1DzZxI+FrDLeeLH+DQ0KrqSOQNiLUieGIdPbFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbSzzTEXcc+BwKdWfgHvlZb/9+7psdE9TukEoVPLq+u7DsIZG3kGDRksMERxzgMkZCCudcNHzWlNVPvKTB6kmE9mTNO5E1p7jHabbG87xgyBbMIowrlqCAgajOyWoWqBVbZHlCwx7Xs+FGP5IrY+m/+allJ+RhrkfVw2LKfeBA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so5203849a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787664022; x=1788268822;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Y+iQzfc/wt6owXkRW+QJJNIcqzyaAjLzqiiwkIiBt8=;
        b=XR+c4AqUbIzcPwlkCgkHHmNcOxbo6pVS+2gaV0YB7GfiqVeure967GW3hmn6B0K3JZ
         mBJIp7rGG8JsZ0j/8Xu0rBkc881KupUtC55AfySwa0O5gnOzkn0j68sqmbOq0kdZOfaH
         Trcbgz1yQSQElVnUjmEKcnf2vcwb+s9vMIo8nNXpxT8Ct4b8N4GYmEcS6CXZ2MQ5k6TJ
         XdTlLFu5yVn/i/JpjIVnGV7WCzUg8PrhWmrKepUX+F4SMAq4OHd3pe5g8UhKRtk2Xqix
         G46hf7qI1WooRpVaR1HEYaEwjpLhqbYfEqgqoMfRC48U/hLiWlV4tCegaZKIItHyf+rd
         D4Dg==
X-Forwarded-Encrypted: i=1; AHgh+Rqp0N231Ts0a+bZ4zIpJq3XkgvVDqRxcZ7HbrtEVXwYwFcvYbXZe1ESYjgZqGmUlSnl/rhLZqPKbb5xmWgQNSsZ6A==@vger.kernel.org
X-Gm-Message-State: AFuF++mKXptv2TtYwpq7UFZCfEKc9GeTANeyQ9Gpxt1X40tjusaYuraq
	NFFNRdnOfBOQfzS9tWQEN+29rrOgNq18X8hxD5YcltvmJ3OQo9yligbVpm+NWHLqzsc=
X-Gm-Gg: AR+sD11swGsbX334dU6Gih3ApQSq9IAfketA4opTTHLDec7lL6JY3iyCtjhMgNQ4+BS
	5yXXdpi4za2FYISkA7riCWxcMYfZOUEXU2OPqgOADzi0Bg9NhTcoE9jerGS9LOYcFTcSzTmJ94w
	TQNCX1s1pqkfnVjKzuoF2lRbQ/4zvod6ZbOypL9cvB9V2HCyXw9KVvit+BNWyx9X7H62vpJ5L7u
	ug9GT8lho02K23b9MU5JkO4JfrR9nyvEEGOoQHxcgDrBb/0A7TZmpsCos3F1Aj4LoDshFTXmckO
	fYNjw8ELcCGB3eOXelo19aaoa8WGeTRzoHQhzwKDWb8KSmOCFUWBwz9ID9U9Ene8V1E7xL+MdWa
	XirhHNJ269kIN3k6QpKL9hObvxEdLbOLtL/B83arp87LFD0ea1GhREIIFbOjdpHdSbPHZ12oemH
	LhmXDXNX61reGzETgl6w+yItq+8wwu7lrnI75POKV0gH9ByaQz6eIJeWAbmUUXiwBMWgePHh+FU
	DfkIvbzuYmDfyh4ECiCayMuOg==
X-Received: by 2002:a05:6402:3227:b0:69e:2d56:690a with SMTP id 4fb4d7f45d1cf-6a5c4111ae8mr8270396a12.8.1787664021863;
        Tue, 25 Aug 2026 06:20:21 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1d741asm13965178a12.27.2026.08.25.06.20.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:20:20 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso8254796a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:20:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqvM9U17od7/xfE9cQHX/hwrPzPi1SpPVko2b4/DEZSlfAr9g4gdkbgRqQg889JmchQB9Cpkw2cKqxX/BNSNhgH7A==@vger.kernel.org
X-Received: by 2002:a05:6402:f21:b0:6a5:d7e0:626f with SMTP id
 4fb4d7f45d1cf-6a5d7e0643cmr2123073a12.6.1787664020370; Tue, 25 Aug 2026
 06:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520131206.932050-1-claudiu.beznea@kernel.org> <20260520131206.932050-2-claudiu.beznea@kernel.org>
In-Reply-To: <20260520131206.932050-2-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 15:20:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5QrWvA4cXYWgttMmk+RPUzc-khjaDfSNmUKcUiW_FfA@mail.gmail.com>
X-Gm-Features: AcwNN1U3OmHmmWpwS87tYrTQJzi3-zHMxDqRDiJzx8Y5-1P2kHE8ffd0bGHqVT8
Message-ID: <CAMuHMdW5QrWvA4cXYWgttMmk+RPUzc-khjaDfSNmUKcUiW_FfA@mail.gmail.com>
Subject: Re: [PATCH 1/4] i2c: riic: Abort the transfer on completion timeout
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, wsa@sang-engineering.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 20 May 2026 at 15:21, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> riic_xfer() configures a transfer and waits for the interrupt handler to
> signal its completion. If the completion times out, the device may be
> powered off through runtime PM. However, the transfer interrupt may still
> fire after the timeout.
>
> To avoid cases where riic_xfer() powers off the device (via runtime PM)
> while the interrupt handler is still running, disable and synchronize the
> interrupts after the completion times out.
>
> Fixes: 310c18a41450 ("i2c: riic: add driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -112,6 +112,7 @@ struct riic_dev {
>         void __iomem *base;
>         u8 *buf;
>         struct i2c_msg *msg;
> +       int *irqs;

Perhaps make this a zero-length array at the end of the structure,
so this does not need to be allocated separately?

>         int bytes_left;
>         int err;
>         int is_last;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
