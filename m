Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465457;
	b=1a3CR51XsPQlmCVqE/w4EBM4VTdG9QAR7SKWSp/bxUAphqzCKpEdgKBiAWz8fqDvPqGn
	 n+606wnFrlSZOV3SN6gibUllZcV44csWRmlIbyca6j1dPcDDN5Tj9mpctC5w/GsLzbZOD
	 gohJX2qolV2+btJhs7sFtp2DSKBiWykHQZcoGLPaRtl14+BB9R4MUimcCVYu0u2Z8N0bY
	 bnbDk9fr4hC7q4BrgCud4m6aMobRJWtsp4v6bus245H+WG+bNtlpxu2LIQmOI7bv8kjRn
	 DN7xmlvZOsIHNlvW89Mky1pjqR2uRkU/Wu5X7DLkPd0oWgXoIS2n6gmv4A3lFEPcolw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465457;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1G36OaovxXTu0LQ+kkMP7/TVPf07CFUGx7fGAbDpiaQ=;
	b=TyycF0tPe8lXQI+9clHw2/Os+oOvZQWI4t3wgrBOnEdoSWSx0jifjUaJgxokd1myl4K+
	 1STN1BEnrYzhi6zC4srMsp2DlQBT8S1oteQqA85lRraBveyx7YFUSmbyVwcPTpnWzVKS1
	 yQjruR88r/coDXgDjoFsJ35dPaUanB0K+LW19KLO8RMCWgvpm6FA9wpdemx9BzFPJ1t94
	 J6PWeqB0h95i7bYp6zjx8lFlBFExmOR+3JFX2up21OK8SDGsE+8VQ8Xk1RPCj8H4r23i0
	 MCrEx7/n01J6YnZfXSLFMxLFH+Cv9KvkmC5zTTGWHGp/BBDRgexXVYBUjYT8Ds8GPbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Te4b5n+8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553BE606A321;
	Mon, 23 Nov 2026 20:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Te4b5n+8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0EF1F000C6;
	Mon, 23 Nov 2026 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465456;
	bh=1G36OaovxXTu0LQ+kkMP7/TVPf07CFUGx7fGAbDpiaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Te4b5n+8loWeAUEtLMSZUihv3ZWV7+y2VMUsUhocvoi18aRAwUrVt08Y4H/HXqT9X
	 YREbK+Ny794vhIcCK+FyThQG7FxeRtRys69sz3QL0XZfOSsILHUWv/66cNfqKepEAs
	 KsJZrB5P7mbwaEoTpc2FeEKgqvWvlFunCrgWD2jihVmiZrB3Twe3IMxXl24krJ5tIn
	 1lthtYmcA4TFxrwOiqMmPRF5F9r8gtqWSn83nV4e3t1mol4U+iJ7ktRQJh6YLGLPLq
	 Xqixsj7zWDp2I+tt/9NWyth/cEeGtjbv9saAeUb8xVkV/NcnhnmqfQFuu8rVvcMg5B
	 b3sfyov5sZjFg==
Date: Mon, 23 Nov 2026 14:24:10 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Ondrej Jirman <megi@xff.cz>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Ryan Brue <ryanbrue.dev@gmail.com>,
	Nickolay Goppen <setotau@mainlining.org>,
	Robert Chiras <robert.chiras@nxp.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Barnabas Czeman <barnabas.czeman@mainlining.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Arpit Saini <arpit.saini@oss.qualcomm.com>,
	Michael Walle <mwalle@kernel.org>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Danila Tikhonov <danila@mainlining.org>,
	Jens Reidel <adrian@travitia.xyz>,
	Michael Srba <Michael.Srba@seznam.cz>,
	Shawn Guo <shawn.guo@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Alexander Baransky <sanyapilot496@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Romain TISSERAND <romain.tisserand@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: display: panel: Make DSI panels port
 optional
Message-ID: <20261123202410.GA1813552-robh@kernel.org>
References: <20261113084236.53336-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113084236.53336-2-krzysztof.kozlowski@oss.qualcomm.com>

On Fri, Nov 13, 2026 at 09:42:37AM +0100, Krzysztof Kozlowski wrote:
> DSI panels can be placed under DSI bus directly and some of the Linux DRM
> drivers will work fine with it: mipi_dsi_host_register() adds device for
> such panel and DRM driver does not use OF graph to configure lanes.
> Examples are Samsung Exynos and Allwinner DRM drivers.
> 
> The Linux panel drivers affected here do not use OF graph, either.
> 
> Requiring graph port for such panels is tying the binding to one
> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
> requires the port.  That's a mistake, because:
> 1. It prevents usage of such panel in DTS for other platforms,
> 2. Places the constraint (port requirement) in wrong domain - the DSI
>    host needs the port, not the panel.
> 
> The port is not needed for the panel hardware to operate thus it should
> be optional.
> 
> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
> Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com> # renesas r61307 and r69328
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied to drm-misc.

Rob
