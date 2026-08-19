Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D925D43B4B5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132351; cv=none; b=iN8nm9R1u4EW/tPkjBiyOgazkyqtRjBkT0lTJhpA9fTVaYjEOf7XgVKiUGC2N85LkfcxOtT2Dv1nygtP617tuWALo2Iubytn7bTSjlbPVjpSzhU5EezwyssqFBw3psecGhLWF4Zv7RgqCKLV1dzGpS+UxsikbBMA6mO7keDZcHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132351; c=relaxed/simple;
	bh=zlErMMR25SYOsUd3S/0AwpVYnof7u7gBjzWgLBfix9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YmERO9tfLHHZ1L4TUhWGBkI38ZhpP/L90aqMnqixwfOCwA4broPOe/XFO88oVmlLLd419yKjjqUcqFXCVykUM346YcFSCJEq+0frPzbQLfL9ILe0e6t4pjM1xVhQuULyxS0EPCKGUD+UBc/YgJq8Iv4agRUKjguoQPWAY1YraMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso320235e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 02:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132347; x=1787737147;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=;
        b=iemVtfVR5SRNppJQQJQVbDqQkUYHCxLK+NwbqF1VcTY1Lh21L0PM1AgrvkadcRP2k6
         JEO4DvgDdro9Rnijkv3NNfOzEwWPs0wREew0KIXtEZ3oHH8EhJOqABkGK7IMChhSdYXD
         rbTco8j72PrUZKtvEYX88IVzXuu5YS04xR1oerHeVsII7kieAhQeYTmH/GAfozXQ7Ja4
         UkfggewCiezdUKp5w1wvXpxlDAmcYsSFlVoWR+Ay+qQKKVz+hzwBZY81T7DmHqp2uulV
         uRh/7Xh9t7XgAWNU0LYtQKSJYNMJIa4g4FWuvzv5gVTRcy1zoPv+aplzVc70J4geI0JQ
         gCyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRHbIOx6aQWmfkbAh1C3mBRFkV2xm1RQxAIc7PY3G5JMSZmxIObTAQJcZQIBo3bzdpAGbbsxHx1i67Yg5eiO/FBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhnTiPnyJ8S196+9oMUu/HgdQ4a+xZtXcutEzq8R4fx+1rexfI
	1B+sI/gd1qDExKpE6wUI8I2YjxHOjvZXBKisfUBU8JIOpd30CzydyobRwYUY5+L4LHo=
X-Gm-Gg: AR+sD12ESvrVswgT3SpXbUXp4JSWm1f/11CfXj423euqRYUxU4KJPTL2SR2B/zSb2Oo
	/T0I0Oho8dMTAYdOWn4Zyb/6rOW9wydOQLjDvC7htvF0eiJASA2RLseI6++iA9xGyC3u1204HK/
	I5sTmm3y3MAtfL+zFTwB4lk5gnHH9qF8Bg8feWTs2GdzMg6O6Z69XsDFZoF9h+KAyzALWQySP2p
	VzF9QujxELfM0PE9a+kbaj/IbWpeH+pK3/D1RQjP5P6EVucbSoXbRAMNiZEgglmv0wbGVsEJgCv
	NvY4CkNz7lYJcuHSjtSGhhLeDlT8vvZH9LAiPotgbLxo4ZEYPJAomSGtUJiL71TDCk93lxblexg
	wd2NgUX6KLMWBkqkaWNLdRxFMibcXNP3KnuI4meHlDwH4IxrZ0PIwSW6cV3E/i9yW27oZVfoau7
	6ZS7zRlo6+1P4jS2t/7ApSfhKzKN0VKTG6pWSKonp5g0zKvQQwN9oMEHFiVFQLZZgrUELRM+Fx5
	8Hle/+QKWgsO3XGuFt2FXsKTA==
X-Received: by 2002:a05:6102:5486:b0:726:e608:6658 with SMTP id ada2fe7eead31-777faea0798mr827005137.11.1787132347118;
        Wed, 19 Aug 2026 02:39:07 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e981584sm1516860241.13.2026.08.19.02.39.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:39:06 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-738bcf9a573so322545137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 02:39:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr4K+Bw/Sro47O+pAyJdoPT37pGss+2q7Um1r6JER1e/0RbeAQBZKgBM6/BNC+tdNos96a5L8zE5NUN+XgxJHpLDw==@vger.kernel.org
X-Received: by 2002:a67:e04e:0:b0:777:ffe0:a10b with SMTP id
 ada2fe7eead31-777ffe0a6b7mr539021137.4.1787132346344; Wed, 19 Aug 2026
 02:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818125012.468092-1-tzimmermann@suse.de> <20260818125012.468092-2-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 11:38:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Uwr-MWNK1wEAyEr8Z9JNVhxk4jrnSNE7dazUpWIvLo30uHHQJP967oerw
Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/panic: Allocate QR-code buffers statically
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 18 Aug 2026 at 15:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Declare qrbuf1 and qrbuf2 as static arrays so that the module loader
> allocates them for us. Avoids the kmalloc later on. Also allows for
> using sizeof() to get the number of bytes in each array. Access the
> arrays once with memset, so that the physical pages are available on
> a panic.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -628,24 +628,23 @@ MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
>  #define WINDOW_BITS 12
>  #define MEM_LEVEL 4
>
> -static char *qrbuf1;
> -static char *qrbuf2;
> +static u8 qrbuf1[QR_BUFFER1_SIZE];
> +static u8 qrbuf2[QR_BUFFER2_SIZE];

I am not a big fan of increasing kernel size like this.
You may run (faster) into boot loader limitations.

>  static struct z_stream_s stream;
>
>  static void __init drm_panic_qr_init(void)
>  {
> -       qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
> -       qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
> +       /* best-effort allocation; can be NULL */
>         stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
>                                    GFP_KERNEL);

<ironic>Why not use a static array for this, too?</ironic>

> +
> +       /* touch memory so that pages are there in the case of a panic */
> +       memset(qrbuf1, 0, sizeof(qrbuf1));
> +       memset(qrbuf2, 0, sizeof(qrbuf2));

Please clarify "there"?
In cache? Not all systems have sufficient data cache, so it may be
evicted at any time.
In RAM? AFAIK kernel and module memory is not demand-paged.
In TLB? Like cache, it may be evicted at any time.

So IMHO this is futile.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
