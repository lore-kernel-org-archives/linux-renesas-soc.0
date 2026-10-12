Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6563BB68F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797809; cv=none; b=IDxr3DfNc7Q4XEbs3jsqUMUSOZsduvVI3P7/XMwltD6ynakbAUGRRImpIyDMJS+cTL4a6R+ZVd+/OR+l9yc2HjN+ZUyXk+YAXKHFMz9FURMwYsqdrrf714KHlUx0svAJ3v0dhhN+9WSTGGbflroay2W4BUmjvukOCPWv7oXS5zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797809; c=relaxed/simple;
	bh=rJQIJJCtR2uGKS8eA4Li/AeLyfRBUfwcRDr/RWsQZ6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evjFQXYBKqpk6Ic3KivjwYQW79y5BTQusS3uRL8tnThHY1e8I+BOeasu6QXDSeeXeKLPGTpe6OfPuu5/1iKUy8KD9mWyJLGKkAPdg0GaVe/tbBKvpQXNMPbZKfJ216kluNFfUq0ytlzcKEanSggwp/c2VX3CqLG5Kmqqhy9MZw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ca18Cp7C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ca18Cp7C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2901F0089C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797807;
	bh=rJQIJJCtR2uGKS8eA4Li/AeLyfRBUfwcRDr/RWsQZ6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ca18Cp7C5y0zbP14SwjenSiSS3l1CcG63ttV5/+2sBnsg/B3epdkJyr8jWcOM2kLN
	 aUJg7HQ+y6RkcFfidkua7+gRNIgRONZuabFI1jcjLPsBSk5jceXCSrAs9QR548zBrR
	 RY9aMCQ0uK5abMfwBR5UQwf/+SkqiBlCfC+8yhWxh9aCZIEwbhdSL0vslEzf9cdOts
	 ujPyflAHOwh0RhutgZjJ5+zTkJ0WgmOhA8hUOxk8fCfWYmrhv9Lzq0w/XSica2oZ5D
	 UXU6CqkFoMkNbkBx87UJh+6qAk0X2sNMZJY1oQ+p4Dg3Ta1yOgg6QqJw/H5rUdHdl4
	 PbTIb7TAJABoQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcb2ecebb4so1230843e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Oct 2026 02:36:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwI1YndGV3iVP4Ic+3Y+tpzWjx3wSVnlIvfMiCIHlfNWqUe2cllx2BR3lFdSB21lIiKch1sLEJltFLuGMOcT3Oycg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLDFMurZ9k2ZupORqxYpmKptinnqpPWT5YpTWrK9tX3V6qvAE+8
	l4A8cY13kWMqKPBERJ5FS6p1EqBKLFFnNsfJe0rCLFb8WAFeggwLB9b2z368DXmJon/h6jfXRQq
	JDpwerX2abY5c2w+yaQqWt32KfGyDjWY=
X-Received: by 2002:a05:6512:3b24:b0:5bb:7c09:d15e with SMTP id
 2adb3069b0e04-5bcde6c9b6amr3326052e87.34.1791797806212; Mon, 12 Oct 2026
 02:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com> <CAMuHMdUPXv9cw-obvxW6B6Y817VFkZZFzOjTWi3z_TpOnTJGxA@mail.gmail.com>
In-Reply-To: <CAMuHMdUPXv9cw-obvxW6B6Y817VFkZZFzOjTWi3z_TpOnTJGxA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 11:36:33 +0200
X-Gmail-Original-Message-ID: <CAD++jL=v8wESqKxsYzsQSqkKNVficLhD8Mx8a9Rkn4RhgZcgTA@mail.gmail.com>
X-Gm-Features: AclHuK-VFjINx-KdTsMKykMv3TFGYc69Gtx6_XAKqx0uFq_EkOjT2O7k_aqbPt4
Message-ID: <CAD++jL=v8wESqKxsYzsQSqkKNVficLhD8Mx8a9Rkn4RhgZcgTA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 11:20=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, 6 Oct 2026 at 00:14, Linus Walleij <linusw@kernel.org> wrote:
> > On Mon, Sep 28, 2026 at 2:21=E2=80=AFPM Linus Walleij <linusw@kernel.or=
g> wrote:
> > > Describe the optional ISP DMA line-tick and IVC frame-start/frame-sto=
p
> > > interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect=
 their
> > > video endpoints, and enable both blocks on the RZ/V2H EVK.
> > >
> > > After these patches, and enabling the right Linux drivers, we get
> > > this in the console:
> > > mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0
> > >
> > > This was done in order to enable booting mainline with mainline
> > > device trees.
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> >
> > Rob ACKed the final DT bindings on this v3 patch series so maybe you
> > can apply it?
>
> Media DT bindings should go through the media tree.
> Thanks for your understanding!

Right, fair enough.

I think Jacopo merges these for the ISPs, I'll take it chill.

Yours,
Linus Walleij
