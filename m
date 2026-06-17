Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8743624D4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 07:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680628; cv=none; b=dnIE5b3BUPacT5ptLBnKnCdqD5epkGgvww8ArN/XQe9cXYZ9A49m0jBeQ4y2Whht7iiTecImYNuDcglqTSSVvwUPdcyVgvl4hXSBJSYR4cAoQ8AS29gatE+bLVUb+tg7mx8m5P12jJlQutAU6nCpt8REanmb45jsD6wT9vIl9aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680628; c=relaxed/simple;
	bh=+Q/X+Q2DSg+rq81utDjovW5AakD5MHld6hbZF6aXdkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnTpAzlH/f4D99pu0a1LdeHO0Q5y0xvoINk0dLXsBgjHjlkFX9ILO+C/9L6+qKQVV5Sx/ZPCo5AWVz6AumJavb1yPDMB03J8ci8rXbXzGTSrvn1btwIZuZ+eRv4JWJ2wV5l3iQeCeaoVAwtoT9Aidr/jy13DgL7T7n7IhLmAhCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59be89d310aso488177e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 00:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680626; x=1782285426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8u7Gki8p4EM6XMlf4misGHyXuNmTvOX4Ry5GM+DWUec=;
        b=ibUoHhblWuN/kMhbpvCw27xkBGRMiGkONghagXbNR67hmO2/bwds3KUCuSkNRA9h3z
         KtDgdb5hMsBAy63oZeMnoXvplOdZlpCDiARqRleu409uaNqyFibgTpxPuMF2YHl1Gu+y
         QAfo0l997pdLfEzjTGfV0ibtYtXgUb1TDVtSafQL9V2XA6OSoDANqVCZ6f8+z0AG7eE1
         6o3X8y1RRnxrjBnTQt30eN486XBjyB3VVM6HnO6H+iX2a0yWyGr+kXXQB4NTj7AByA/8
         n+AVxPm61gdqYUHpkFTWuXptJy+v2h5zOA4aMJLfdlKtySaTygRePixRGYG1Vk7w9HaM
         xuGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vaCfJADCBwRwVdSVw2chuo41w3gF6Jsr6KXxrlf+da3q35ivTZnClZDJqn00FbwYpx3uRQKHbJ17fO8fKngUZVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ1LTWjg0JH26OSF6fe0HJOzqU6LAmaF5IuEIgKc0hfbtnFT2Z
	2lscGb6iITtExL7DW1wjpPc/KGf5sHSVsmgcolPqujd2VHMF8Az7Os4cUOLCFg+G
X-Gm-Gg: AfdE7cl5DCQazFyki3dFHjq5dkrmfVsAwkPCzMB5EdaZdDGNlVz6sQq37pcBzDumw7n
	MSfSsztCnSyu2mVZpLA0HHxeOJpPsVO0U421hzWqK45rMiYbXCUh+57eZCi6IsRaoNsRL5tiqYT
	avDf34OJwdQMneEh6TiD51Ml/X0CKpr0QUQ058kIcwda04gnSZZ5QcE7T4QphhClJKKNnp/prIu
	NWIlgZ9E0OcH4nGDqMYw63yYKQjZfQISzWwVi2gCvStzd9umPEIlnkwU+RIN2I7yosa4RrbrStk
	f+edzZAs7R3Ka2jWwQ+odannCI+jZY6sinQhbEQkDSFH7ZRU96hLBrWL/cCvK7+T/DpvrUGJD3v
	Cq0Dc4rtyWX9gz9txILQSpqLPvyLKKBRDXbvRJFCZ5no6JRyO+WIMz+4fq55GmxWg6F3gAdSQZC
	rLuNW1IXA2+sBJVWNRZmhLTR23FeMl3020dDLhKF27LCOArdtcvVqDhA==
X-Received: by 2002:a05:6122:c2c8:10b0:5b1:9fce:696 with SMTP id 71dfb90a1353d-5bbc10c9956mr495195e0c.3.1781680626102;
        Wed, 17 Jun 2026 00:17:06 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901ac4d6sm7892615e0c.13.2026.06.17.00.17.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:17:05 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bbca605be3so26944e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 00:17:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9NPmkYz44ZSpX8ErhJbJnaat37/kVLUb1duma9Xcb+UZCenLF0QSKIRNY66dd2NVXUqs6lrlYG1QXUUXebDy797A==@vger.kernel.org
X-Received: by 2002:a05:6122:6315:b0:59e:2a50:39ab with SMTP id
 71dfb90a1353d-5bbc106a67fmr555519e0c.2.1781680625185; Wed, 17 Jun 2026
 00:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com> <20260615-rcar-du-dsc-v5-2-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-2-aed1a28610e4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:16:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGpxip_h1dCCQ1mdpW8m+hP_PjmjzVmyRpDUtGQWR0AQ@mail.gmail.com>
X-Gm-Features: AVVi8CcYLQHmYJC_gazcaRIfqz7y7D9l_HFtGh-yRcroThw0DCba9TthKbXFofA
Message-ID: <CAMuHMdUGpxip_h1dCCQ1mdpW8m+hP_PjmjzVmyRpDUtGQWR0AQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 15:12, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
