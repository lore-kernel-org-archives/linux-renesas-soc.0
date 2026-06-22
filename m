Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEF92620DE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138612; cv=none; b=bMdTCoytXw4wHl+CHcfAmyw3AXM5X6mFEoEzCV6HLDiZUVUjfvCQPnK9ar119Vyu8fcmYpfjfEPan1RVv07uMX3ZjkRTK4wR6JbNP/BOFg66mZhxc3jKKuhb/N0SDga7tqMdASBhiqVHYPU9Zu0Gl9JeiP0AK49oekHk7ul7i5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138612; c=relaxed/simple;
	bh=Ro4kldSGCj75UbrLEjM6s2V1KehmmbZXkph4aFioNGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+RXvrIAY6cLzXmE+t37udGh2H+bzCMmY79gSenRcfi9437rlY7SP0OqqE89gGIxBQ6hvg2+IOuYj+fDI3kF4LBEc6ufPWlx3Z18lk/wTHBr1uErOOZMAZI3yNdfdsFIMnr9Pcb4FQwknY1GoQGuWmuAqm7qwfUNMdkJBgqsSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0aa420401so27861345ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138611; x=1782743411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aOq01qBfWokATPNy4wCdepesNQ6uzH++qL84v4Uj4o=;
        b=FODqSQcXI7z30jqU5NW8l+6CY33GbTTA50IlhB8r6PltEtQiWEdEGM7BXOGhEcsZag
         ar8Vt/YFHZxFcNuPJOOBHcidoT298eWBsUboEIWJgCgWTZdUR74R4JM07pfv0Tm0q0P7
         hbuKOK7DTegnUHzwhTi6i/0DzpAw/3VZZ8xEReHFCpXH1hhT3bCzCFJ3qrJEMiUsLEP8
         TjoPYjk6wPlfHpTbdnipnUgV/wrygTS8PG2wnfxLklDQahcw+Z9Zbo10K6pCKE3k1HmC
         JQaDIGsnJ0XlAsqMuUeIqaq6oCUJ5uny6eUR6RAoZp2fjEea3X4g+JyyDFP4ajxq9mGY
         DN8w==
X-Forwarded-Encrypted: i=1; AHgh+RoCoorPVw0hH77dFq2MjKQcsVzXuQr/RgBcvDAsCTSO1bG1FIAhGRzAIjBBuOpH2duV988iR6VvbmVatmHDRzXr6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwRQuKeUZWzYGG6Ug00GYhwV3AnTG/27UsjBJo14y7VKSl82K
	LqEkhWr+57FBY4avto5ZuHnOcvjUNL9V1eX+c7X9x5zt7QLYW5JkkBQCFr4B/g1ho1s=
X-Gm-Gg: AfdE7cmlz04HA+xL5vHKzwJeC0QURufZXx9yQXvy5AGezLZtr2OiI0guz8ya4J1c7PB
	uRjYyxdJG00Tz6yD7zULjjoW8uAUuGWcmPBTLP9jhQc/7mI79dDWMxtOgNKEt50UmU/R+ECD8lI
	vkUw/4rlXNqX45ZhAm2rrVV5qXDx8jwLLma19u1K4LL0wgM20g/+RqE+Kse55a4R1j1XOU4hgUj
	ZuzeqM0jfA6pEmqM7NA3m8RZHWomNnOntmCiQ174CJuVRLZGzcdKVJh8gbw5RXcAUyKjbQYqjLc
	rTswUGDoSCD2oMl0qiG7Trw9iC4lsME8ImBrt1JeBuWOTvRJh2Xw8SyF1PGNzgLX0v5AWeYT520
	s4MIuD/NwyBT/ggg1kww/4+EQMhIRyFmjC6fsHeQ5WE1Z2qNxQDh+Wuawp/Ka5UPPpJDC7Ppy2F
	jP4RenrhKVupfjdkzcqtnt9vKI9XqTvRKLivKeZEqbMgpx0QxM/hKo
X-Received: by 2002:a17:903:2983:b0:2c6:abaf:85fb with SMTP id d9443c01a7336-2c725d9f80amr155389195ad.32.1782138610806;
        Mon, 22 Jun 2026 07:30:10 -0700 (PDT)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f6395sm84152605ad.28.2026.06.22.07.30.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:30:10 -0700 (PDT)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so8327995eec.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:30:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RomWMPsAbJ1tyy02puLkpmB4rR5i3haGY872x91vfp3GOuIa4rv+TCdok2zWmpSnuWJ6p2j3gRioPiXTiHrZAqSKw==@vger.kernel.org
X-Received: by 2002:a05:6102:3ec8:b0:65b:c17:70b4 with SMTP id
 ada2fe7eead31-72a737b1e13mr8162349137.0.1782138164258; Mon, 22 Jun 2026
 07:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429115054.158160-1-herve.codina@bootlin.com> <20260429115054.158160-2-herve.codina@bootlin.com>
In-Reply-To: <20260429115054.158160-2-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:22:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsPgy9=n9GOHgPV8de30b2meCYQzSrc1pjukhgzXTNSQ@mail.gmail.com>
X-Gm-Features: AVVi8CcgwVfL1IUsAw20nH_KUPK4EgmpmvX_pvnt0Py4OJDVBYzHBOW9UXb430A
Message-ID: <CAMuHMdWsPgy9=n9GOHgPV8de30b2meCYQzSrc1pjukhgzXTNSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: timer: Add the Renesas RZ/N1 timer
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 13:51, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> The Renesas RZ/N1 timer block controller is the controller in charge of
> timers available in the Renesas RZ/N1 SoCs family.
>
> This controller handles 8 timers:
>  - 6 16-bit timers
>  - 2 32-bit timers
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
