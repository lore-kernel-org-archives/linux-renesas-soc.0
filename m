Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8CC46AA79
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546744; cv=none; b=d79YNMNAwC7iwxOmhmeldojw+JWmT25dGpUfTwlJwHtd79ufWdnF7j/27lV/amzITUB4IlnS+NmZJRifxXX5HuMwxviiAWrxwobiMEtK8ybD1d53pIozzwMu8H6DFJMNcLeOSEZfrzZfINkPxMWhvl2Va8uZhMjIQRubz2o7VdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546744; c=relaxed/simple;
	bh=bRRFLOi0SUlTBPUZZXBUEi8tUw09gDt6fC1mK5VN9q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3fU1usy/qc5W8Jwhpnz5ej7NCljbcsftd83zofbx492bdjVMTQd7lCa0eHNrM+1WPVOhSGNDZeE2PJviN7940xR4emoZ1M714vGkeo7bRoK9B+7pT4FEu6vLFG9uRGioOCPR/GYF3NfJY/8Dwbql5GNDNQCMIHEGSi4d0ZhKjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so307858e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546737; x=1787151537;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wao6sUabhYyxi5I23T/MtVc0JW4acfJHcnD9u3zRBF0=;
        b=BOdiD6n/t5J3GNu5K4S3ulwTLjOG7aXNmsl9ds48zPUwOCb+4Bh8KxYJy5Lc8mI77V
         8eEff48+MDdLEEmrwdKRXvLGPWbd0getDrbO+NLBVnhDqrXritzrXGkhgICcVzZpDKxl
         ZRgCRxmQYbvQ0/00g0UFcEHrtQ1QbNRtTfnu8t72P42Fd+9CshE4Uu9fz0RqE31OnEXL
         K9xFgw6S2H6FQjolrvCb5OUupC0cau3K3IeLjf4GBlPBza70EIIb6EjbDcz4AuYO/n4W
         8X72sNg1yWREHfDKa66u1sIPkNmP1jnyD+TP4R/T1emxARIJznuowBut/HDyjlFeCJ6y
         hFCw==
X-Gm-Message-State: AOJu0YwjpYAV8rz2OEZ1zv3C91jkNg6wzV6W9YlDiFgvwZf8WiQP203z
	QPCGcHncO4kVtt/hwblGIjGNqoC6jSwyqOa7lvrGuyzXolY7IA1m7q6DHeHivdDn
X-Gm-Gg: AR+sD11NC3xhVcEn/rfWdyoJbe89oQy9WqkMQYbZZ0DpLzF01bc4hkTD5TX3E0w+t5w
	r4TOogFi6oJnEzAvGkeI6a7KBks4XJ/pUbXptyD0c6CAXy19h/TMGd1E/LBKIJLXK5ILUt6I5w1
	OKDCe67eLNSUBZ6D92jVSU44ZjZoYCZnzt+6abXZn9sNK+JuQseTMKgK5gzBQMWwG2MjA2iWOX3
	WK3bMLFN1s41dTMXTTeVV3ywDVNShpozVuHX8PnVd5LH0Y/j+IeEAFfRjBAiAkSwbXnMcEgDLt4
	0Y10ftHg+b5aKIXB1O1LpIPAlVBBtjqkxcXrYThXUoojvC6CUXN3Ei3OAJLGm/Uf+cTTVMBV0HX
	qjvIrtUNoSAbzPIPpjBZETMScDHhoay2mijDKXiNOe4WKxQMsUoYL+Uwr62Xs0v6DgO7vvdyiPv
	CdQ1AKzoCUDo9DJa6FxJVEiXkcpbDYidAjfqyUVg2kTomSzAhFcQ+ICwWQuLj3PlTYstikmkkoz
	bF38wa0taIfoVBOP12R/XRjL82b5g==
X-Received: by 2002:a05:6122:e1a1:b0:5c2:c0b2:9889 with SMTP id 71dfb90a1353d-5c4f8393880mr564179e0c.4.1786546736731;
        Wed, 12 Aug 2026 07:58:56 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b78f393sm1202629e0c.16.2026.08.12.07.58.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 07:58:56 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so357091e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:58:56 -0700 (PDT)
X-Received: by 2002:a05:6102:faa:b0:73a:128b:ea07 with SMTP id
 ada2fe7eead31-76c8b1b2837mr1079354137.14.1786546736343; Wed, 12 Aug 2026
 07:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718182355.50045-1-wsa+renesas@sang-engineering.com> <20260718182355.50045-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260718182355.50045-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 16:58:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+wsQQSjPkdfegoGtkAfqSxzb2V2Z12-h8ZpqDgNEW4g@mail.gmail.com>
X-Gm-Features: AUfX_mx12EUua5a6cnfUXAwWAjImVSX14zsrRCDiCV4ET7PUf7ljqhlh_9dVKX8
Message-ID: <CAMuHMdV+wsQQSjPkdfegoGtkAfqSxzb2V2Z12-h8ZpqDgNEW4g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: renesas: rcar-mfis: convert spinlock to raw_spinlock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 18 Jul 2026 at 20:24, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> With the upcoming hwspinlock support for this driver, mfis_write() can
> also be accessed from atomic contexts. Convert the spinlock guarding the
> unprotect register to a raw_spinlock, so we will avoid potential
> deadlocks with preempt_rt.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
