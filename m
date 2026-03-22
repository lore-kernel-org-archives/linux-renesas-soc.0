Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3911935BDD5
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774188806; cv=none; b=D04+2fo42pPh9tik7+z7Ih0mkMvdmr7b08oJ5mZCCbqdzaZ5kQjnlhFLy+Qo74joq83RfFS2GMiaIiefqAX3cih0aZXMRn5hejVbbCLK03kwIB52LNs4jSU5WoLZhUE9SY6lSLmaMgnZAAmdUAoyns5LDLgxJIc6dcrHjlFORm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774188806; c=relaxed/simple;
	bh=6WyenFkskQRviNgIdSNi6d7LvQNFj/WN1yDFKmE61aM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y5hHDI+cQydzxfu1jh5+yr+o7913Cvu/DmeMbu606fEFfivNUl7S7Jm1D1JFdCFBl7kmU05H6GRX9zpEaCklZZ6d2RckjrWG3otiDG2q0OqZhwxA3BJHKjDqD2ycrd8AQ3Jw22aBRiWXI98OTH+vNoQavkNwAWOd7s8970mLKzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1JSvO3v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1JSvO3v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9F4C2BCF4
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774188806;
	bh=6WyenFkskQRviNgIdSNi6d7LvQNFj/WN1yDFKmE61aM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m1JSvO3vBoAW11h+1jUFpD4M3o87pi5WVIS30EG+IpjrhSbVVm0n+a1tBuAfjEvBt
	 DUqzvAtEE8KJ6CZfJtmKqQq9BVDuNmVeWZsoYGhGiqY+t+Q6RwWFQc5ZQdL1p/KZIY
	 UFQwKK08jzzYTvqEXZ4Ac8G4DE5xsSYsUXc8IfhWTBw9DfA2DD2C6LLzRNU24IbyFb
	 lrOIf3a8BJJBT9sBoXhMHNUMb8I5hhEpcoV0xfuwNuKiNcSCrIcGPuQKtmayUZ9HXR
	 hFKtrSq+WjK11fCbeC076eyEPEXZo0kTu3ZozNAe6J8tQQi2tgc/U6j9xLH40yQ+qZ
	 AsEOEj7QkGiCQ==
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-127380532eeso1358897c88.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 07:13:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQi5NqmpYtOXn+DvU2AF20Nq1u1uVB/IPP3mtqhEqL3REmm9iy3vy4jQjejbp8/Nqp6M/yNDQ2zaq27EW1ZUaJig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyop9a7iZKH9ClKA12Pufb2Fb7qVjCwRF2rY3wezzi4Y0oo9BXC
	UJyvd5szHCiEWyxDnuwGIb5LK3eiAxet8q46uv7Nge2bDHQ1xf7kksBog9qHlFjC7HkFhAkJFTj
	tYkUkFB9wRT20+F0LTy+BIfaMJ/N6kQ==
X-Received: by 2002:a05:7022:629f:b0:11b:9386:7ecd with SMTP id
 a92af1059eb24-12a726e3eadmr3908663c88.42.1774188804941; Sun, 22 Mar 2026
 07:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-4-ef48a517828e@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-4-ef48a517828e@bootlin.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 14:13:12 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9PH4yV-mDFZ+mkNRT7R9qoZOtjQhhqmyWjx1LWSu=giw@mail.gmail.com>
X-Gm-Features: AaiRm5108rX0H_CDRkg1jedFrdyn5bPiHycKlLMUICMJdSqU48gN54_ILYySwo8
Message-ID: <CAAOTY_9PH4yV-mDFZ+mkNRT7R9qoZOtjQhhqmyWjx1LWSu=giw@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/mediatek: mtk_hdmi*: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Luca Ceresoli <luca.ceresoli@bootlin.com> =E6=96=BC 2026=E5=B9=B41=E6=9C=88=
7=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:22=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done by using the drm_bridge::next_bridge pointer.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> 2.52.0
>
