Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604DC4AE10E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639687; cv=none; b=BPCtqT2tOkM4Zt0kjVJeEXdfFUCF/G24y4bSURiUi2IsvK8hRD4fEyni3kp4/RjGF6gHC4Qm/gkpyEmfW/RVBYJSUBMvtrvgMqDT7bUsEZgpmPjzjvjx5irih6K0VOTbp0rduinLGkthzoDNEO06ol99lnFbMb29Voe1zv9AEdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639687; c=relaxed/simple;
	bh=lyxCvXomazoscclUR0t4ky/vHCgm3jn4yYZm7vcNMNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEv4PnvqulmfuF3M8l+W3tJ9MJZtsKtiOW76x22j3fU48xJZPbNBOX95Slerh8VubnPa75BQSUux1+uTDAIBVtplBSaHz2ndPzyQYDhD2JG6wifKjcHhBAS+nnaJ1WApQx5yB3VTqaSmJI5Bo7Ovl53YHRFbctjUuJ0LeVqLSm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067fso75683885a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 03:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639682; x=1790244482;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s008ZoScdhr7BNxJ8Chjjcs4adQQJjIUFRUX5dqGglE=;
        b=K/bJTByFf0FiVPkJh+zw33WDpTP/5hssfu7TQEJPJsdv6yEXpsCVvKvT8q8gvKf+oT
         2ILpQXl603XTS9RAUAP0Y+LEqmDES4vIq4lv8c8qQ2Ke9g1GS9me63v3CyT8FDdqyUHZ
         gn0u3CTCHqGNSruJTTIh1Z5YQDg7vbIv+uf5sFZv2abjw4rKqOo8A4MIVk+nCKN5m27y
         6cX8zH/tJhG3vKfBaBs0RyI002rh3tZ1onZP7wyMqi4imBSDrMCCmDEFFWf6gKqM2Ni1
         jjxMV/bViWcpm7SEA/8yzLiyk/wXfiLthfesUyWOJScWCFL+Bw6Oddj8JuKYDYm0CyWp
         PsyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3X+yVr1Y55Qp/50mjE5rI0HzwCW6tTKtWFADCIB2/KJ9DVEH+xRaptm4zOo1ArEFKW4GzXYjAuAMMlBljoY0yvw==@vger.kernel.org
X-Gm-Message-State: AFuF++nn6gEiKcl904HNxJfahAIGKx+VNng3nbin+CTOwXIPBltcJcyD
	BoeCPuqyjnfyMYZu1vQim7zEdzlWRDdxB5NxGosuzDOzSM9tBuNVtrofDzWYtC0ZV4c=
X-Gm-Gg: AYBFou03w6Zf8C66t1aOSPlnT59lsQsG4XXNC8t6yK43dMzmJNyxnSJtHPnZflFYoxe
	0EMdeR0SaiSFIYgIrcz9dY1d3Vs9/JKcdVKJeb7627XnJlKkj8/VslnxLoGS+KPWHMZDc9uO/uW
	OY7XkQfxytLQZKRsjZVNE2yFTzeuGWoQKXl+JoGxgAmvZgU5YpfueXnX1ud4wuruSmoWRlBx+vk
	KJyLLKnHL2etjQfltRhQmr0S9rlfMiZ5sx25B/exc50QYRzyJ+C9Cd0wQ1AEfBr799HrkWecNuS
	AeAqunRfBM8fblZLHXKyO1HEjdCk/oS6fqqnaUZYwAlMM7aRdDl/tOhhDm+X1+hbzhNGTCIIsCP
	FWZ2TJM2c6T0vVpuhGe7xAYSL766Wc9MLBDLLEa9quTP5Ej8pBIry+qn4hrdGUHVRb5tEASuGXh
	jPkjkhUzdRz+cO256kmyMxYrZxYJgxIKDFDW89hSFcAMo4+ldzr5X8O6fZoA/y8zNTWBjjGuUGp
	OpKW+3a3WmDOpB1TRkc6adJxs5a0utZn7XL1Q==
X-Received: by 2002:a05:620a:8905:b0:93a:1ec:748b with SMTP id af79cd13be357-93bb76c4516mr1102149985a.20.1789639681686;
        Thu, 17 Sep 2026 03:08:01 -0700 (PDT)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com. [74.125.230.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7822324bsm427247885a.22.2026.09.17.03.08.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:08:01 -0700 (PDT)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe20aso6565676d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 03:08:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByMnTz1lyh7RQI1j91GHwH6RL7oHTJrwYUqb6F18Ky/05it3MKs+yMhWC7P21o8VzxWfLPXyWvvqM2TTKTwUQDWMg==@vger.kernel.org
X-Received: by 2002:a05:6102:161f:b0:79e:cc38:c40b with SMTP id
 ada2fe7eead31-7a0285a1f25mr6780296137.11.1789639183155; Thu, 17 Sep 2026
 02:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910085430.3173166-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260910085430.3173166-9-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260910085430.3173166-9-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 11:59:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFVd160eAuWAcxqvRWUnCHZXshCZscnRoYdiZGCzBqHw@mail.gmail.com>
X-Gm-Features: AcwNN1V3Cad5Rk6IGr1bTFS9lb5rrCjt1yRBSqziGUl61jF7JvalYEJw63TOIlA
Message-ID: <CAMuHMdXFVd160eAuWAcxqvRWUnCHZXshCZscnRoYdiZGCzBqHw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: r9a09g077: Wire up DMA
 support for ADC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 10:56, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> RZ/T2H (R9A09G077) has three DMA controllers that can be used by
> peripherals like the ADC to offload data transfers from the CPU.
>
> Wire up the DMA channels for the ADC peripherals.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
