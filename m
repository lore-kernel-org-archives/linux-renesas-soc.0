Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C919D35DA53
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Sep 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279319; cv=none; b=GeVHBIDAF2TWgO9t4etpFfaO6XtiKInWI65aAyjxd+ZWu6rkAuLsXz4Nj2uUpn174QRzz28rhgNSAa+yhItR9WkWL+C5p44R5E+whPsJSg8eD8zfCHvwNLQh54XY9FpQlGNJmUXbClHIAHzyVMEwUEhGnhnQw3uw5IbbZ5pIFaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279319; c=relaxed/simple;
	bh=sVmVzt8GgzZn8jvrQuxVaR7Ad1O+lxZF27bkoLHptvs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggFoSiE7kxZrfCqmahmJjAcWgqI4TQijZ5Y39BZCpZBpaxEosw4KPUhNk1Pvc9KP0WsLVTIzCdmfIazO9pKAfFVjtPCHF47wmTQoTYplYZHAnX7G5ckmDUdoJiwjlYQx7n6XdqiJSicmR9ICeY3A21+cY3eTyXV5oUtykqk9cO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaJEwRm/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaJEwRm/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EA41F00A3F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Sep 2026 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788279318;
	bh=sVmVzt8GgzZn8jvrQuxVaR7Ad1O+lxZF27bkoLHptvs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LaJEwRm/DFlOnl1mYgCfRGzrC6JfPIkqeYk365T6HqHO+6kNq0afbytV07e6G6NZM
	 4vtiM8QynuwbmFWstf7U6GSt4JirFqIjezl+BkPM54F8fOmdq2Rb5yF6DJ8l0hwGLg
	 26oCw4CXK6P2qzd2jRTz9FAKelpvVHeBofhEglVi41HU0dW/mAQIAUm+05hXN1/QTM
	 mAUbi5R+6Ka+PCYSZcFTw0Pq2w8v7/sQS3gMrPrCYVdlsRrQIz/4oR6j6iNVXvwkj3
	 0bRsnFV1luxdcFuZUy6GLpZ4evgJT+jQeOc/TG7dHHAq7HSggYPRBWaglc9VcgBkOZ
	 P7WcwVUbIMlSg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so11035291fa.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Sep 2026 09:15:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw3KlRPhUSl3/T0lW98dtgJWPIek3yoDBQd2eKRU47hHDYhQ8EOsqdaWEKN7p0p73TZvg0/Ixwb2Jlu66fNxGpJNg==@vger.kernel.org
X-Gm-Message-State: AFuF++k+3uJ2MZAEoZV5qkmqCDFinmwXfDXTkFNgEmzrZP55WD60gGNm
	1ez64gpPWgVUPQH0ORQn0fSumlxMwhYyJVEKEmBPjEFBC9CMkbQ0UVqj+NPCBUfCOFAo+i47ZcF
	OoHrEy1jnDb+cs18WxgPKKOSSjcjAljF5PF7fP6PG8A==
X-Received: by 2002:a05:6512:2522:b0:5b6:4b1:f8be with SMTP id
 2adb3069b0e04-5b604b1fb1emr1186371e87.31.1788279316943; Tue, 01 Sep 2026
 09:15:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:15:15 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:15:15 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260826122742.153643-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com> <20260826122742.153643-4-biju.das.jz@bp.renesas.com>
Date: Tue, 1 Sep 2026 09:15:15 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
X-Gm-Features: AcwNN1V8DuvVovyhVMeiT0SihZ3OVkh2HoH1hRxjyitBpeUT6HAacUJvV22owPU
Message-ID: <CAMRc=MfAdTMb_4ii=up-ESwc322YYjzseyvAxshM6vUcEGfxcQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] power: sequencing: Add Renesas RZ/G3L Power Ready driver
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 14:27:25 +0200, Biju <biju.das.au@gmail.com> said:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a power sequencing driver for the Renesas RZ/G3L PWRRDY module,
> which signals power readiness for various IPs (USB, DSI, CSI etc.) on the
> SoC. The driver binds as an auxiliary device to the parent SYSC driver,
> using its regmap to toggle the SYS_PWRRDY_N register bits, and exposes
> {usb,dsi,csi}-pwrrdy pwrseq targets.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

I would prefer to see a stricter .match() but since the parent is the soc node
we may get away without it.

What is the merge strategy here? Are patches 2 and 3 independent from 1 and 4
at build time?

Bart
