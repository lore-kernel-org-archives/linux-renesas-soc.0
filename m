Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696134E4C4E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 06:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059458; cv=none; b=HmolaR/+Yy757+LoDw3rIg00eRbiYKSS7fXPGRpuca6tWFrFzYjajszCRR/+QJTlGZs0h2YICoO5ZGEfL0sF6ghoec+2KSfwpaBdkczdVFilc/bteJfLk+BgqlIT1ouJgURmQJ5Rokr+KmlUkgMkv/Pfgdef8Rtfbf6HdEQPiSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059458; c=relaxed/simple;
	bh=KuZZEDlH2BTViZR/5FmtDepYeZ94dWiGKrfDtedWqdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XE7AuIzw9p/zCPipxcnVydghEkVNIAhnq6X6jMKnLbW60Vej8wCms06IxBPz49U9KAwgJQ6Aj9hx39bmOonZN6TfZlduYghpKvGiF5N3I97ch+OARFAFuIx/YiCdIWsiz7IKtj/F/Zqw1svl4zDS0gq3z6X0x/UGTNXMDf012tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-982838c4cccso431021241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 23:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790059455; x=1790664255;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pE43WIP/B8Af0zd1OEayR+RwR/Tk1IZvZVkio3avLM0=;
        b=QBflY8/dGnnJstjVvv79n/8AIfxXL3UzXJFGlgerdm8VXr7ZW/LE8jCnjW3a2XG481
         gFUFyOj2VEGhuzP7Exacw393ZL6KzEzgh2WuDe/e5y0wme0TmBiA4gadhNefwDkz+ATU
         Px7QPXOhbr3qBxuv56iAziyEzfeo0tkG/IoiamVonTTqEFBTZnNUSHio1/5IHCzp4cW+
         aK0IIc0WPQSQffAgb7T0GbmtQoezvwq1piJejixEIsJk2OOKjLh9918++7akfr9gZ5Au
         eTUnaZJrZX0FqnsX8bqznB1NWtFxgMles1/yXag68DelPEbmuII5iBhkppcLPhrt2GN/
         lg5g==
X-Forwarded-Encrypted: i=1; AKwUvBwyGuMO1NisoJUBYRHcd3ItLCAKYnnrmdT6SIvEdNmDig7MtpVivEWE/6rrNOlKImVXtq2c4EBogXB2ugRrzC1xug==@vger.kernel.org
X-Gm-Message-State: AFuF++mmQehHJRcmq19LP4vlEtSKG716lvtVdL64dWqxIfLXaaGsS/A+
	MDFkNigT+BWGHUHtZ+LB7FyY/GaHtxrrJU7wdCBMQQpCr0Dz9uSCVFzNoKUHjbzf5bQ=
X-Gm-Gg: AYBFou04/WmFHn7xkqXd+F27RJRpPgdKbHTPxiUp7Jc77RuRg8OgwJD9/NWINmfWd9J
	m27E9KNMClnh2Sq9b1yXq9aF4NgWpDrhoDRSfhu0Vtc7IiMAyYJpsgeTKM15/w5tgKQf/gv0jFa
	2+Pvf6Sky50qKnilpPFU+T8LL5eJAwaF0TpyS0HnLwQ0eElncstwHN6hH1IJK4W7lQi8ZZIYhmN
	cjW5gaBJnkV5rQti4cdiMDFtGg824skPhfloG25oIAFzbpxiBzzCoGy4mhABAlUEQwf8qynnRPn
	EV9MhBniHgnBt/Rw0+eDkMa4LBDhrPK030JjsIDbORZeOv+AgIpHXL0QsKzVb7b8t+4coTp2BMQ
	EsdQEs7NB2F35KJa9xx85F3/MP2zEMsD2cWse9KOLWW8aIt1j7pKA4G8WddwQw54NjRL43CHvzO
	NLRe8iZ84+UxEzhatPzoNEBg4amF4QcASijE0SSJ42m4eT3BnpmBrdtdQ97TiFMiS7ckCLX0LJh
	nxmn5d2N3CW2lAwE5wJZQegIm1DrfTKkRPD
X-Received: by 2002:a05:6102:484:b0:7ab:79b9:683a with SMTP id ada2fe7eead31-7ab79b97a75mr5260137.27.1790059455278;
        Mon, 21 Sep 2026 23:44:15 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9850d382f2esm872605241.1.2026.09.21.23.44.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:44:15 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-79022baa364so1064270137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2026 23:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+jkuHAmJTCc8sDyw3aKE00HIg17ls8uXk0H9fPnTkCzgHmFChH9A5E7ZNwyrD7+iaZNMfsn4L69Tr7pyVCD0vSg==@vger.kernel.org
X-Received: by 2002:a67:e886:0:b0:7a6:3df6:ac95 with SMTP id
 ada2fe7eead31-7aaa080ecc4mr1420444137.35.1790059136564; Mon, 21 Sep 2026
 23:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
 <20260910181918.31551-4-marek.vasut+renesas@mailbox.org> <90a90fbd-63e7-4f85-ae8c-335b664e485c@mailbox.org>
In-Reply-To: <90a90fbd-63e7-4f85-ae8c-335b664e485c@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 08:38:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjAv56=91_xXTTErAfS1brS7-s-4ZPHWB=eCpoF_KwEg@mail.gmail.com>
X-Gm-Features: AclHuK-rpqNNs63WVNzxtY1Too0qJAazs_ikggL609BMVbx2GdHhFI8yN8r-DE4
Message-ID: <CAMuHMdVjAv56=91_xXTTErAfS1brS7-s-4ZPHWB=eCpoF_KwEg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/panel: ilitek-ili9882t: Add support for Ilitek
 IL79600A-based panels
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 21 Sept 2026 at 22:32, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/10/26 8:18 PM, Marek Vasut wrote:
> > The Ilitek IL79600A display controller is similar to the ILI9882T and can
> > be supported within the existing `panel-ilitek-ili9882t.c` driver.
> >
> > This patch extends the ILI9882T driver to handle IL79600A-based panels,
> > such as the 10" Raspberry Pi Touch Display 2. The IL79600A uses a similar
> > command sequence and initialization flow, with minor differences in power
> > supply configuration and timing.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> > V2: No change
> > V3: - Rename ILI79600A to IL79600A, there is really no ILI anymore, just IL
>
> Is there anything missing in this patchset or can it be applied ?

I don't know: I think you should start doing cover letters ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
