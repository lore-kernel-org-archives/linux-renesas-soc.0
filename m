Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609102;
	b=pzmb/jeuZE74x/IeBSSdVdSOoe1Xr6Z0urRTLyfZG71NaHfy2D5vizJ5flb4YcXXqPxx
	 s71e+Bbjio0vgg8Y1XuXH8N8ooMeeOKkbrIIqi4QWqHYQcZRVf/U4AeLDkweq+1uB5xQa
	 AYppaR8S3IE8xOI5qOmqRbHH3ZLvfMJIUUpFWAYr0qArs+lSOwsPIG+E1SKUxdrgF+RTK
	 s0DYaJvtAC7Z+uwNTaLd29TwgD23tvYNGgpKo5p866UIsM5MBgeTfWiUg864CK7ISBjpK
	 3I18KVWde2rFBBMvIFKePAuSD8I2KzMxW+z9spNK2Yg0GlSHEIkde2sXsmqsNuL9/Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609102;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=w6brxhWc58ejPdDmDsjZBb3VI0jzhlT7oBmaZ1G4V/4=;
	b=aQ59mje40fW6wyaY/HpsmA+Qk3FSCjUjxWWpEr1EINUYEQtf9DCgGdb8xKbB156UIiE0
	 eo3SKX7bsDTIF+wjqASOmouWCz12DIsTgOK22HATd+iveY6khKZwMDk5ksthXp4M4ZObl
	 kGqzELeoIsBWyGvPw2LJSiCNKnGwFiiN5U0y43+PleSxPjsEPM3pK45KjXIu5mheklwKI
	 uL9ZUTadwXk6c4J3B3CSOKvWcXeK27FTTn7WMKdnq/mJ1dnk5ZR0XISsmeAJy79mCRLYh
	 KRXDthrEYWTubhz76wlHJrCRK+wFbZSsMcv/x6kWDzg0g99+/dRhqL7XQsLR7E8EPBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3UgWEen;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F7B606A31E;
	Wed, 25 Nov 2026 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3UgWEen
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022BE1F000C0;
	Wed, 25 Nov 2026 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609102;
	bh=w6brxhWc58ejPdDmDsjZBb3VI0jzhlT7oBmaZ1G4V/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f3UgWEenHgZd6XLE/pukysN5IutxEUMLdNKKdEK9zJsRki4m+Z8/DuVppUciskqiH
	 hUv8Bg7TpLKz6HidPpPzpLGvA1Eum3t0lFmi3edx/zNZqzeijeipQWmLpJsdGQ8N6H
	 oWgv2qkvqg6Xmvx2MwfU3uZ1EUCVOVPMQmocEFXMn9QdCrIBJovDIK1jlV8nCqgaDu
	 pYbWX14eqOgkzt2cl5dikb1t9hi6059ZL7uwxKAGSoxCYWP+WylaOdKxfUZeHT0jKZ
	 yfVquEHqcXFUmZUimfKX9S7dWLyb7LpsnfNfIhrWRrwClh7hVxBYdHt62y6Rnen18c
	 gJTnK1p4kh2CA==
Date: Wed, 25 Nov 2026 13:18:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 1/2] Renesas ARM defconfig updates for v7.5
Message-ID: <20261125-tidy-screeching-nightingale-f8c74a@quoll>
References: <cover.1795540796.git.geert+renesas@glider.be>
 <cover.1795540798.git.geert+renesas@glider.be>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1795540798.git.geert+renesas@glider.be>

On Tue, Nov 24, 2026 at 06:28:35PM +0100, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v7.5-tag1

Thanks, applied

Best regards,
Krzysztof

