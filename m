Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840063BF68D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716762; cv=none; b=jf1Pgp2QL9+hktbcxkTRa+W45HUb1MZ8IntSy3I+YNICpb6xaohXs17Jp7A2ky2Hh4Yr8PHbGfRGS7WecX9LCVH2TlbhWl6dad0BxZd9m2Gk0tZygjriuCL/JggqtYV/uaqcBR/ZdpmjKdmkPu32i62KSbxUe/DJBrtahfIHBGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716762; c=relaxed/simple;
	bh=NugjXLzwOtZ1nf9/QwO5U9XElx8ikylWyGp468AuBbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9Ukqh8XscXv6eOoJuoGlNgxjQSGlBs9iU5eTgJRG1k5bX3mbugaqklTOVZPZKcoOkKuZAReRBmCvCvp4pEO72pbErb4ljAo/29lKhTjPhAlxbzhQrJE+FjKXlNeMZy6azZl2LDqqPABSo/998hfucwzqRdBuum/gKhX6IlY3jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so300033e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 07:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716753; x=1787321553;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wtbu+SyUZkqlYLbujFQ6GXH40pd+ttBBONZTj3TDFrY=;
        b=cUA0F43Y0Tj+nZfTrPr5Aq0iV2BIsVRfUWNqQiqLeQSJ/CuxwxARpD7XX28ilThKef
         VhscD1auWQvOGVHHM10a1mt/5utNW2If5P0t9AP8sTeoIPaMewYnebMxKXWJVGuoHFTF
         TavO5/5ZFbZNrFL+w11CoytleMbUAMOtZ6lxtA0MRYdcBmzPeVX8e0TP0WuGtJkbzFX1
         uvDNTRI+fSXd9fFFUP3sWfDdkICLxPqVbjIPV21MHvr88x3bkkzxUu4nygqWuOi20IzV
         GrIpCk5bu9IWBXyeWdkSogwXXoWnofV8nsAuihjSfm1zQu6cPACgniQRnY/N1UlZh7qC
         j1wg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6UUnXi7DgTXSib1GgluJ6guJnobxzpvzk3kWQ30EYBnG4kT0EdyZ+SSG8GMT2UwBBMpdAfCxhDGl51zhIjT50/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YySzS+dwOqHDcSwf0bCgbB3LsmglfXa3ZOngEi6hB6n5jEX17Jd
	DWYSm2DKnc5c1Mn+TbrTjVAMkDKLLQWqro0R5rlZ+qE7xvCZVwVokmYCp9jSr+Ntcp4=
X-Gm-Gg: AR+sD12uLIZI1NxKlaN9uUzZLNFJTiXNWbUV6G3hnStUK+7/tWvDPgHdj9oKI8AQynp
	xSJ6If6ab9bQamNAU3O3QIrGyas3/0LQb3Z2xekYGfvsa7v4pfXtPu09Lu/zb0WApCGcCayu5DI
	/orvDyv24j1YR6n3BVswsgj0lIJxbq12UJ3SvLcAfFh3Z0tvf4fl/yyJqtNKN04c9wbeQYNVd3U
	KMilP6HzZkqKy13AkjIaRdHjtn4Xs/AaJzGe1TglbiNRVMNLsl9atkfe5OXjHPybGZgjpy34AtO
	Al5/KG1pTeAvf8kiaYGu14OJt2AF0mF/QDO9DRdzeeIArHiTe+70hgpKgmQJeGdxawcIfSCkdUT
	1K9rd29ueBOwQEdVsHtNCMdv7Q9qebq1laXCXvkT96CFVr+J/eo451GzjO7wwjylhjTHdPTOMWP
	IQEybcZWvQX31onR6Nv6C9asDRwY7vrDKcNxmLta0pSQjb4Dcpej9aCwTwreTNIeGv1CC4fx5mg
	i6mAiWrzZiDe8haDxtBpz0K/RR9IA==
X-Received: by 2002:a05:6122:e247:b0:5c2:8ba1:1c2 with SMTP id 71dfb90a1353d-5c591eda68dmr1021404e0c.10.1786716752926;
        Fri, 14 Aug 2026 07:12:32 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97bfbdbe8c1sm875435241.13.2026.08.14.07.12.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 07:12:31 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so339424e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 07:12:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrBmYvj/C8J026v4jIxVgoY6vDS/KWasdvdHlQyZh1N3GDkgg3u9RRNup6n4YW4OJBjkkeHwJfSRU+tM7ovGnOM9Q==@vger.kernel.org
X-Received: by 2002:a05:6122:4f83:b0:5bf:8955:a8ce with SMTP id
 71dfb90a1353d-5c591c5d861mr1055714e0c.1.1786716751169; Fri, 14 Aug 2026
 07:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812115010.108322-1-biju.das.jz@bp.renesas.com> <20260812115010.108322-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260812115010.108322-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 16:12:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVA_PaOjox5_h8obGrhFw-Y6HjJ+cHraad1FNhmha1+Cw@mail.gmail.com>
X-Gm-Features: AcwNN1W2zEZOvyjzzcJTZb1io8WyuqeKBzea6HUdyFaW-EkhAXUHwqLrotgIBuM
Message-ID: <CAMuHMdVA_PaOjox5_h8obGrhFw-Y6HjJ+cHraad1FNhmha1+Cw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY
 for R9A08G046
To: Biju <biju.das.au@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Aug 2026 at 13:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SYSC driver registers a "pwrseq-pwrrdy" auxiliary device to
> handle the PWRRDY power sequencing, which requires the
> pwrseq-renesas-pwrrdy driver to bind to it. Select
> POWER_SEQUENCING_RENESAS_PWRRDY from SYSC_R9A08G046 so it's built
> whenever RZ/G3L SYSC support is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
