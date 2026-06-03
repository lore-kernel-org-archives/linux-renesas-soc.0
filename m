Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5456D481669
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 13:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492404; cv=none; b=Ss1Bk8NiJuMMaRIUeRrgTsKaidjXHONsPyXAjxuhaB68qQ+2Qd8GwUfCi26WIUGcmsEr6Q5dHqxUSdFaKl2uaTFnzKtRLrJlFW+FcbB6lJRZuIWvPmUQPw3puyCA1CmK/R55KUSpg3K9f4COfj7fRepVbrDrZqHe80jl26Yw4mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492404; c=relaxed/simple;
	bh=Plptqs8+MeS/L6HmTwPUTp1dXY/x5J9010knqhq+i/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SwfiCwcLFJSM003INoLQqkWadYBXEdD+LAffl6qaUVyjwW2Mph2wKYj0mxUCjkn6fTWe9TPfJm0HIa9q0NX292xb5OBmVISe2IVvnDOHM9rtkbtzWTsni5VAr7pfxEXizgRs+QeX6awLWptQCDZmksBOiuPWJkaTuZz4jxiXYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68ae265815aso2053118a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 06:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492402; x=1781097202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vDFPb86PvQvyL1RfDQoX7OYCgpH5JEVJJIcrin/l7k=;
        b=swWxObYo2K+Ldi2abgEW7ZOvis63kxTfWpGdVlGq6J8ZzOQSttMQChwAp+sk7lJSlj
         rfUeEG3QVOj8ueJMJI18WUIAszXDKh4KCf4KQd78a7Zat1y61chzByVskaBHDgfAk2xT
         0V/pchKC+KaTKhIyZutKv6BtzcMormBMqE8eB7OvObJ2Xc9OngKsrTvel6XU5WDeJFrt
         4Qo9q58+TnHCNdGFtiGoqbdes0UMdv2d1SB8Fmr9aQEDMLFIHGknGrmYi6cscxElnorz
         hCNv3CKBvrsCBL4k7cxaoniQB94DJC5UpwVwTct/5P2qoiNrneQmVf3eUm2Sy/OslQxg
         ZELA==
X-Forwarded-Encrypted: i=1; AFNElJ9Utb8Yj5qqIIoDNUSC0istzPI1fX2n6RNQQBiA3mwLMejs6/e21lSQE1p/HphmjsaBG+yMfT8Ou4H1wmMRQSNr9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCxYgbuqyiIxU4cik+YR2T8KYnMzv+mMIJy3tVsmlIb3uiDjGG
	fUV1pTZ5nHkpOLKf1rGm60/Ryn4av706ft2MstqeQJvUw+Xsvbr/r+Ux4WE0RBJidFs=
X-Gm-Gg: Acq92OF/ISmgM5CvAph+b8YzbMpElgA3Z0WEe/YEy0eexMOWr72ufAamf5Ab4iKEAxa
	PdUW44uUfyJ24rz9bO9CtzE8txZcMmPMty2LX5eHzl92K957Is0TTTYIimktZYyr0YrX5tyRssF
	2tvgq51IHStC1itsAp0ieNRw/V1CdhUP+b3q5LCDRXVpgc4rkW3V/5AMcJck9SGHIyeyEqBMQNT
	+ep1MdrLzpKezZrWL86atqTXEyMDJG5XWf3WzJJqVBQMXsUWS0zXaHvk1C/ttTYwkKjV1CdalsF
	3lXrIqTxcPA0fmaeus4v7sy10YlZXxzqVWa6tqIOWowQBWUSqctL+s5LcUO4gmMf5uuCRtTNC0N
	rPceXgKv77o1bVTWpzgZ9/LGT/4VprQ1+w27VVo2SuA7Khka4kWTajOjU01PNPojeevKoFiIDmX
	EM4361Lykj4TnxmJWY2osYowYKuBp9PRst/hd8u4Uy4LM1ZzCxc9abUVlogJn51qv0qjPmwAw=
X-Received: by 2002:a05:6402:2681:b0:683:93a2:dfb9 with SMTP id 4fb4d7f45d1cf-68e6f2cbeecmr1727430a12.1.1780492401629;
        Wed, 03 Jun 2026 06:13:21 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585177bsm1129885a12.19.2026.06.03.06.13.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:13:20 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-befee9e5ef7so202815466b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 06:13:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ80IhOjiIMiYomjYwh7unWLO3KtzVpFFyMDqCq+BWau46pqtXZI38NLfxbw2aeFu0c7aLQ+SedMcJOoGvLrpV6OZA==@vger.kernel.org
X-Received: by 2002:a05:6402:e08:b0:686:9c15:3121 with SMTP id
 4fb4d7f45d1cf-68e713e3184mr1563082a12.12.1780491958656; Wed, 03 Jun 2026
 06:05:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com> <aiAkdZ5XuYC-wpCL@ninjato>
In-Reply-To: <aiAkdZ5XuYC-wpCL@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jun 2026 15:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXG200TTrZGp1YJGt7T2u9vUy9ipoRaOWw_jTaa8Ui81A@mail.gmail.com>
X-Gm-Features: AVHnY4Jn5WJuuexJ9K698In0uzIER4UcBvwdWNgk9D9nn5i9fKP95_v3uD6TZnc
Message-ID: <CAMuHMdXG200TTrZGp1YJGt7T2u9vUy9ipoRaOWw_jTaa8Ui81A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 3 Jun 2026 at 14:56, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> how do you generate the CC list? I wonder because linux-renesas-soc is
> added while only files in the freescale directory are touched? Any idea?

DTS:

+       pcieclk: clock-generator@6a {
+               compatible = "renesas,9fgv0241";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
