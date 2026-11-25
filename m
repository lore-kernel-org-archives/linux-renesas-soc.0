Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614427;
	b=2a7gwN8c+CiBokRHOnBDQ6Fiq3ukIjLq+u/hllcm/HxEeOYbr3AtM8f0HFfBTOTU4b4U
	 9AJcRfRd5WZWDXvkHQLJ+q/E4DpCBjC4I+zkD3ccL4wC3vpocvIZxFmGzRe92y6QviCZP
	 mlunybt19qVUX91bDDPWyP1qGa0vKM1PYePe9/oCcrIe7SvB7T97bvXTpROiIorMioKGC
	 YvyJy6ihPYf4SYtbpM9/0cBBpVu3s1Kd++PyukSTlW3YpxQrrioiav6EuliykiG2bCGhf
	 76RyNjkUHfXkatyVrUGvfbXNWzpAroafuUeDDiPezBeYX50K9EsffNvNGAF9PgkzgoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614427;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2ekL//nLkvdKCy4gvj7fwkmkzJPcc17yCmiUTnNKDpg=;
	b=zd+MR+Uy/EpiL8+vzwbGsC+3z2Vj7AQwbbsNf85rsIYVNWo6w2Taa5gKIAivV9WVNanY
	 pQcXuXvmCNOYiSw1tJ/m2T09jADcu0rg+Jhno6yE1J2XlUwGxHw4AthBNuGIhNiZKgPXY
	 VSloSFGH7fOJCTjL8NugyNT1yDKNhRu6O2/fcKtHE/Y4H53s93OpHpxfisbUvjpE4NFv0
	 k4RjFtwd+ILRKFl1oOjursJQgjonqL71dbFVwP89k4GcXDWPnXUgqWCPysF9LNYsh/RjZ
	 5f2UNx3IVeKsSJQnkmyHBnZSFjhBlLbkfoi8ehWk15Kb4XcWmwQTLucsmICF1d4PeqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5i9O420;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED785606A323
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5i9O420
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037061F000C4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795614426;
	bh=2ekL//nLkvdKCy4gvj7fwkmkzJPcc17yCmiUTnNKDpg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O5i9O420RufJvMQedyS4utLY/NiMgFdpv0CHqDyfoI1t0SivlAvcVSEiU98tx4jv1
	 jvT6UWanD1gv9N7WlFwn4jE/3lqGZSncR/q3XziX2DSL8QC3VcGmtYmFzyO7MKr6Pk
	 20igUrMxbEmkUglX7jFE/2CuqNABEYoZAKJ7a74nT/plyk17cCMX23EFGRQIYGzCM4
	 OgvEd3UjpUYqlKyBWAp1WPALzNcV4MWZpxBTwM+P3Bj43r1aYkxLicbMvkPJxw0CuC
	 bG4Ko5nogSH3VnPZt4IOkfaCzDTpHiPpL2Gz1BsRd9+fuhFE2YMDNSjMrgxzy6rGhc
	 MJK7CUHg4Zo2w==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso7851418e87.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 05:47:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHfQIAY2DXB+0sUgSnONoj5LpVFyUx6Lz+dXanBVjO6j7gw8oIM5tifb1fYfaplUGiS71orNCIGaLkhnCECbfSD0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9noKmTCQ/mZORNy3nhnDiQGYFpHIlg2xu9aZUi1ta138bHJVcg
	fkqxtFecK36zgZdhmSdYVoneCRQqAFTihcY2v9P/3G1wVE3oEcgj1GaiD5ERADFb3p6u1bKhYes
	eMjQOJsGPX9qanhff1dyGcXT75hKKrlY=
X-Received: by 2002:a05:6512:12c7:b0:5c1:ac31:b1e6 with SMTP id
 2adb3069b0e04-5c1bc8631e0mr4499372e87.49.1795614424812; Wed, 25 Nov 2026
 05:47:04 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAD++jLnrKwRLGqz=F6LDy_9v7rrWnu1d8RjQhbupeZt0H99f+A@mail.gmail.com>
In-Reply-To: <CAD++jLnrKwRLGqz=F6LDy_9v7rrWnu1d8RjQhbupeZt0H99f+A@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 14:46:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLk9+3amc07dm2bwHypoePHnc2eq79Du1ynwoX9obUuZdw@mail.gmail.com>
X-Gm-Features: Aa3M54rUJpADXeXDT3jJQ5rIEz_mZp6GPOoe2X7jImMdZ4GyoyyiknjRfaXS1-0
Message-ID: <CAD++jLk9+3amc07dm2bwHypoePHnc2eq79Du1ynwoX9obUuZdw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v7.5
To: Geert Uytterhoeven <geert@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 6:29=E2=80=AFPM Geert Uytterhoeven <geert@kernel.or=
g> wrote:

> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7=
e4:
>
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v7.5-tag1
>
> for you to fetch changes up to b2a4ca3e3d4af9a3a1e02acdc934b3702ff8ffde:
>
>   pinctrl: renesas: rza1: Put fwnode after parsing gpio-ranges (2026-11-1=
6 09:39:17 +0100)

Pulled in, thanks Geert!

Yours,
Linus Walleij
