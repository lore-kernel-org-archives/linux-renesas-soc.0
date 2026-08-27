Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FD0379C35
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2026 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787839347; cv=none; b=OcjCagX/cQqT3rSeZ7cH6X8mOC1r2j4ilgn8V6a7RBrH6j7/M9OdrglVOs981TSzANL+MpnDaGVvytIR7d48SvDUevkp37rhmUQ+GW0bdL5vCcbKHx6l3d+M4MqiJ95exeXoJsN26fiBd+9pAXnDFDuyJr2tHN0ECAbwzEMVA4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787839347; c=relaxed/simple;
	bh=svxFq16jhgUwujetnMHf4NGpGV3nz/ISyT60/BUazac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVoF6iewjJkSPZjdGFIgNaS0mo0O1/Y1fkiVqf7EM9K0SpnX4mp0M8F0HzTEHXwAJKPToR94rEVCn0g+bEllB4WoAB0uycZImWuieTLk4DeaDdvTsRStDWXP1ohbYBH5TUv1zMPjaEHgqnRYYnroSAjj1KsoD8q4508O8cBgbC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUJ6aqgd; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUJ6aqgd"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so2206589a91.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2026 07:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787839344; x=1788444144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eDQwLy7w6jGmaKdMCoLcam164nOHb3RGtOUt5TvcQcg=;
        b=aUJ6aqgdc7lB0MYT97zhFm3BKF4VbtAUUU+rIIKwxCq5DLh0YDVTxydMjSS98jsuz0
         igirDowxj076/mH1COYePoY1V9FOv/WRBYZzKhBL0q9uprhWrdk64lHN2wBlJHEYFJtu
         i9Pz/9Qn8rWil2mCwxv8yfFBsPmFU4njR6d7QKzkue2zZ0OHTveI4Vr6eFcMmvWDOd6J
         2gxaf7A0wg5vHnX/zUxkVbtGlpob0Omfv8nuKdyLfCZtbyqff2413FvB/Nwb2pd0Ijbs
         ZSohLWE//HNMvVy018tgKtob6dL9zUzRgmhaO38WMaSBZTFxOTGAkXarbvEjBwAJyh03
         zoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787839344; x=1788444144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDQwLy7w6jGmaKdMCoLcam164nOHb3RGtOUt5TvcQcg=;
        b=UEp6AoYNfhvnyI9mA53RuINxrrqbfsBCAjIvKkZI2m2viGwOQUaYGGMFd/O/5LR/Hn
         YKfLbpQifPemspzJpu8zBgzlfH4LoQ8n4Du4nCq3QJzVqPz0VI5sEf2Un9TidHHmq1nY
         0GFdheTuk69UYqQE5NIN84pWFMMUDfYv1Uo/t/DdmIl23W2jyNnb3Dz6Ca3MaTtsrJzC
         d4gMFYd9SHylj/u81RPDAGJZ8eoMubGPx7Kaclh6I+iBmBtUgyh/ZyuUaQIZ/XfMuybV
         69S76R3RfwsI3UZroqYp6ap0NbM2yyUrQjcRV/epyrkVJgW5uykbQkbWPU7DJ11cJrZ5
         JfSw==
X-Forwarded-Encrypted: i=1; AHgh+RpfLIA1aTK+QeoiBh6JabsZb76V/TCtzFOSX+wy22xhR1SINCjK3BraLoPjnJOrJbCEj+W2Hr7Jm3zEFRZXGpQH0Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lYt03GBOs4YHPIpv1hudW0ShvkaWE4i2k7lFyTsn9rbUaB0O4M
	tJGZDZjsc7FwoKuKkp2K9wF+smmQwP7yHD+s4dJuhC8j63VbbbfQ1RMe1Nqezw==
X-Gm-Gg: AR+sD12XETKLonntLCa3z3YKoiWuz5d26+9GfJJM78gKlxbf6vHQia7CdtwujmAh4/s
	hOb0vVLKCHJBkU4CNyxbLvB0zqDPG1RFFAUqG7Mb+tpIuBivMbtXHf3ni9zeS6AuDb2zyIV0Gwa
	IRSa5fFGPJxgt7Wg4/xBSwLaWa647U9MCJL0amki4347z2nDmi1jQyzfxeXmL824DsTlXz1s0Wu
	gfKcAV3hTuNXSV0XNY+5D1FIkLQ8LlUge5aqA4AmDAB7t4vMGYGvctnLWGe2eFN4yKCNj0llqZs
	isEapzBYAkdbVVC0xb9xSZoV+SacnR7bUdBA/oDJXkCJ9C2M++J+uV98Z28h0/ssxILXltx5uit
	AWQiEPtSH8o03FDgVfQ9zdHBLT700JTctyAqTruH4I6nXfZZVMihPc9Nghmjbtv9ucOUZ8u+bG+
	JltsmwfQaG6aX78/JoBSZBhcKqeTe0HdwfPuQv8muYu0+Mi3N39CY0meN7zl0dv3Ku8SBEj1pMa
	g==
X-Received: by 2002:a17:90b:4c8d:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-3966d1443a1mr31804030a91.3.1787839344389;
        Thu, 27 Aug 2026 07:02:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396759cab6esm2023470a91.4.2026.08.27.07.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:02:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 27 Aug 2026 07:02:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add
 CPG/MSSR syscon support
Message-ID: <9c9982cf-6fe9-4904-b75b-c0725db5073a@roeck-us.net>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Aug 17, 2026 at 08:25:37PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> resides within the CPG/MSSR block rather than the WDT address space
> itself.
> 
> Previously, this was handled by including a second register range in the
> "reg" property. However, this is architecturally incorrect as the CPG/MSSR
> block consists of two distinct regions (0x80280000 and 0x81280000) that
> contain registers for multiple peripheral blocks.
> 
> Since the CPG/MSSR block is a multi-function block, introduce the
> "renesas,sysc" phandle-array property to allow the WDT driver to access
> its control register via this shared regmap.
> 
> Mark the use of a second "reg" entry as deprecated in favor of the
> new phandle-array approach for SoCs that require WDTDCR access.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,
Guenter
