Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3246AF36
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106562; cv=pass; b=OcICPtEA/yHoeyVqhquR0hEAsgQQVhnUJOMIYDlSq1YBMRkU+ecJDRj6tc8UShKBgKB6TP0DQcwkvpqnLw6DTQA3m/9Fzla459JPcPu5/0GvJzri3WXMPUl3EmvqGaszPfF2HEav8BV6QcQ9/EgkKYvyENbewqUJRfQTkijdCaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106562; c=relaxed/simple;
	bh=YeyBR2elHrxfkycuzA5dct2lwgZEFs3Dlxw2M2FOFRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exqS0//EG/KrnHZXyJPWpjpCRtkxL3oaplif8+H1+kvad1stTzR0EcSIQn9TUTuzKdbO07+SKlvM69jLqs0zmMUQDoO/fnFuKyHxArZPO83M/VU7OiDwpPqiQkFeJ8A0q+rUGLTqrS9AuRhskWut74lfW/OvV0OKtYuUZWpddE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFFqzryz; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFFqzryz"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8423f236418so3878680b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 08:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781106559; cv=none;
        d=google.com; s=arc-20240605;
        b=UwSlyqzCdMo2GWOjijlKNvKvg75KkW5W8v0esQ/jGZH3PGO/8wJLScHM/GkhIvFwEe
         piMAciIZp9sKQCa8LJv5iEuVwVECrHicu8ghkoNqpEP1BSHcbuJgIZjFJAc6qRNyEqd2
         CQTGfj6BElljgJl1PZBPL2FgBoe9ENcTmOORB3sgoiac71B2awkwV4zEk0GUna0au2Or
         NeS1eRXmndfNtVvuXzgXwGJFH5aM8is2oMlGJlsTINCSnoN8YUNo5Wd2pA0o+Is+HAFJ
         AC6uIe9jZCi+oy79NV4haPz0FjkdciYMyudpLhT2oEyXGz3vJxwEvQHBIhhHzf9+KtGG
         Japg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OxVkltXdFaXumR8w2ItYv5evLNP9u8ZBM73veR6/lmg=;
        fh=YfL0vhH//HTlCtZfkPGnL17/rCMlKfrX0Po3xFN/PGc=;
        b=Hl0K2rjQXSbXQNLKbnhALn1d6q6+jZ+RK99QevKQtcuvl5xVrGhpL/sWOfyTwPjzYJ
         b9/H/x9cRCJiW0CS0J/fhgrtwmpdrM/uISObYc1pDuf3WqeNKocRtjXDwi9FPTpAuDjg
         NPlVdEkOQ4P59B/Bk/OzYQjfGxCNcc4eBCNIpVULFDzc+3x8sQTH7q/zD5ad4zKxvkzw
         9XqiygSNXAsxHm5p2YYCY0q8ID/NnzXZsmk6iIn9S47ptfKFQ4qQWgY/8JcnsUJwX0O+
         n4ptWI1I2rRmXERF/AWyUj7W+gZ7dr91ZvmaYV0BqrCxaMGSmalbBLZozArcYzqD6HSH
         rsTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781106559; x=1781711359; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OxVkltXdFaXumR8w2ItYv5evLNP9u8ZBM73veR6/lmg=;
        b=IFFqzryz7NLZ/+Pjq9GqTLHwW0lDmfxRJCMIZCDqEKwCaucxlKSbVMZRXkcvg0iZuA
         h1fBVoXf0DSVGd5l0f5vtZSJe9TzHH5PdCH1d8mro72tLt7nb4LWLesqz1ExPCYqcb6l
         V+GPf5r/TRBHsx2djqxWgeusU6555TK7ff12/hMb9oZ4hqcbzZ+XCrDCoNHdpsOhh62g
         qAg/TvSRJzJlSCoFhD1+2eWaa9bEIFbUrpRBGWEqul/Macg6BLn9DDelWLYIEh8ziBkj
         C6QN9iEiel3cJRYCHAKbVf/eNKeZpFgAAtyrbmWLEm57u6trCo77HFrDh7ILE7Ky2Lvk
         5ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781106559; x=1781711359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxVkltXdFaXumR8w2ItYv5evLNP9u8ZBM73veR6/lmg=;
        b=gKNj2+Z7gvWs4oalAAgitAlPZ9Zl88rRf6Dvfc3ZbYgCmVNhPj0aVxRe6sFyiOwU4v
         kujdwqr1F8h45RWvVdrvwZlvwbmiRm4+GdekZkgasWh9lfOhh0pU9MqsnpVRR1KcObLp
         WmHFhKqP5KG/pnWilwuyqMXbUjg9OCKtFXuHfpD4r7SykU4MAIL2GDPzcwFU4kRI1rHL
         bWO6NSrA9pftj1NdjHjLvTPeuuDTFOOJBeNoBxf4J2FBx8pOY+2BqLaTh/A5ZHZhtQPy
         g4BqfLMLn+fwyHdgiFaDdtrsbXyfnZ9NwOpafsYLZUwWYaFadLB3m60z0IuxKvjprJlt
         1Wzg==
X-Forwarded-Encrypted: i=1; AFNElJ9NLicabfdoKgOteWHmVoMjeD9uVP+97AZrlWTTFGRTXsamOmyLcZ0sa4/wrWofq8y0sSc+dcntcDB7wFlhL0PSgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz2yog8658ATPk3reNhaEqEsM1eO7yrzIpd+M640yJNbI2WF3v
	3HCUNBOKw9ZaCzpXci6wB3XrQhjY2Tk11VTVi66S85EypxC1Makim8Tx2whB4i3FE+L7i3iMyi8
	EJ3sFZLr8+LfHnc4SCnJl6tFdGdpTyNI=
X-Gm-Gg: Acq92OGFCT7T1W5lxKLcoLW2g7gOXI/2uKN6ohalw5NvEV13dzI0lYc6XKi9IXQTSjY
	xOpGBIq142/sgxN2K5S7aWJnMMuhJAZIcJB6l5NPiISxRMzBe07ZFdq3/Cg3SLXRENTNCpSPrq8
	O9qKNXhi0jbIq+piD4joITY/RHqp/ljtPYH37faTNZxvcnb/4w1jAVkEo6h03oCvG4oJHi7OwSA
	j38RkVqcAy/XkW5VXFdYVyfOY7qB6IGwI1Ze0etHYdoatIANgBQVwx4Wut2XxyFv6zsukCzONkg
	Y5MaMk9H+cEDn8fy6jY76vcyuCCoSKAbCpzzSGMMEPWfn1FYQe2zWNH4Ndz8OmMbkM/S/SDxJNC
	tvKVIMmI=
X-Received: by 2002:a05:6a00:2d07:b0:842:4bf8:cfdb with SMTP id
 d2e1a72fcca58-842b0f83825mr27414215b3a.32.1781106559343; Wed, 10 Jun 2026
 08:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <178104804456.232889.7203992010119048881.b4-ty@b4>
In-Reply-To: <178104804456.232889.7203992010119048881.b4-ty@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 10 Jun 2026 22:49:07 +0700
X-Gm-Features: AVVi8CfnuLEls0gWL-kPL7vOI8Ak1h2Sin-pMsKBpL2ilAbWUniKUhlFxfreSBM
Message-ID: <CAABR9nEhomppec0TnkE5YnjzfO91K3JHKY38tYe0FQ5-OdsQKw@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2
>

Thank you for your review and for applying the patch.

Best regards,
Phuc
