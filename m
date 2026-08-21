Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FC1450911
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787310390; cv=pass; b=DUqGyLsYet4y6lELVVlwvqEpwZFTbOF0nBs5rHYX6Q4mOhx+bHxYcOCSF6ovDT0tf+hQcm0/RtcHC904cEUxHk0gzXPs/27Uv5FfYC8lRCq2RwZjaEi5i9GnVmShisQ/wa3JOf8f0yA9wsajjVkBEh9Fp8AkhJa4nbASfiCe+x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787310390; c=relaxed/simple;
	bh=KrZ6HeRxc2ZB4KNjY9rusjhD8xWXy4q4jVkQHO73EgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFEGxA8h1nzGU4Nx8GH6wiSogLh0nXVnKGYsDW7fFsGFgO99n+SUbQUqwi9uamGN5W2Mjr+j1noks9W6maDxmguuibR8G9oex6M3R6f6CNiKSCRrxJS2+++t3PrUue27sfitPZSDuGnehTyBIh5LUJVpzDp2X97q7Wjzra14Wks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8m9tW3n; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8m9tW3n"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f96c5b722so436808f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 04:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787310387; cv=none;
        d=google.com; s=arc-20260327;
        b=Wa6dcM+Q3lJVlgleFO688CqXeCWCq7Wlt3Ype7qqs9mguadTUhK9PaxLckoxUDNDNN
         ElZ1+0bRyHyJKPUwKTOoDkaKsJRLOKYrlBiDEVOE21kVEVDRXRQN+L7BdIaopennY3j+
         wIOMKxIQIVgiJJLGGHVDcLdPusWLH6UxdzkSjzSwYnZUCOLrdicP61inF5bBx/+E4AjS
         XMwgCGImACIOMhpcSAP4EPdJl6NhoeHfYBry8GJRrDJHkCLXtldhUYH9A/m3TD9946YQ
         wQl4EigdiV80+qeubOZLMfFOaBQjmdRiAk/JLlqP1ls6Mr8GtHSXYsIZQXRfeHTOZfsP
         ksFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HoJf6c72cR7dmFL5Gn6KP1hZaz/7qfGbBe5YOvKHjgs=;
        fh=nrY6feTWpGEdI8/11zQEIINYN9BUUaG8XDE8qrMppQ0=;
        b=AWGfmCR0KvI+5SCC5sX3VJeTwy7OVuoAskHNK0gU6iEgzKNEbdkg60B5dlymcP4wis
         a3SphRHNVYp/6w6DILi145nEq+fYJ9i2O9xMNgERaw5yAggoj9tEIYNo7R84EvSOLIrX
         n9ngQSDHomppDcQ5lVpNKkc9VYcSGIrOAnz7R8dHpqbl7eAATkLL9w4Hh5HuQCtgO/BB
         tJI+RkyjfEeMDG9i/5CYRgqpHKS7ilYAZmfCnAPt6iNtXRl5o6WZAlB55tyujAOamgnk
         VEbxm66Wz1cLhf3VZjh6F9HByIfWAKR+2qN0q7qfCJHnmEfoXEu+bQDAFbocyQOIlS7O
         9+RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787310387; x=1787915187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HoJf6c72cR7dmFL5Gn6KP1hZaz/7qfGbBe5YOvKHjgs=;
        b=d8m9tW3nM+Y1r60sS8EOkeQyEfpz8DPciym6BDPezegSU6e0mqaGGtRR2x6mo47JYk
         H4lGR2kQ1TLKnj2Ky+2vB6Ni/DQ+JhAnzTrfaso/VJXOzFbqmug7IxBow8wVyqWfSA58
         eKE25VmYC2wSUWbGWbsKIIxli/pUwCwjN+TM27hxE7KhDog61lgaX7Brt5qIAZ/BNBZB
         vkQ1FoLxSskQcr+IwnQ1v9OYXTAyk4RjaAi7CA39LqoNDYfGB/+FdZHfQE9CZ4QdXIG1
         VKNe5sagm1UUcoDJqYUfkDI5KfYkU1RGCRdbpRUaW8eDHg+HlmmBMwY9wjVag0kckKvy
         p9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787310387; x=1787915187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoJf6c72cR7dmFL5Gn6KP1hZaz/7qfGbBe5YOvKHjgs=;
        b=bDMEILrk4gwegM5kaXtenyAlQO4suP57bMo1wgHmIH5slhxtaqM7VmRD2i3NncL7z3
         dFoB8+lyPxRcM98KbFoc0tlnJ2zSH+EPrPL2sh4o5P2vCfcdzLiryR2W8EsIp/Twuxmd
         XhiecFNe1oMWoa390qWssExpFIaX6/z2OOHYDkJdlSdOrZb+jXqAJtd76fXt/LY5q5Zs
         ki/F40nj0pwBUJKM8KfGRCmI5OiaTQWTW13eV+E2MoGv/sWalC5h9dFOwy0qNIsZPBca
         v9Yz66s4a6uXhSFeiI+x0BvoGvLS4JA1Rkqn3n5MypYILGgJ8GLnUlPHObNgFPViERrY
         gQsQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUp8PSB2Ybv+ngYZonnjUmT6rf4vQiTt5kgt7jTWufOLxRCA01PeKtNHdW9wGTdamewIffth8KdiJGEFKgEscsRg==@vger.kernel.org
X-Gm-Message-State: AFuF++kacj/FkcbvOaqCvwPU96JNvNVvUp9H6pABq2hwZtrAn/4fyBxA
	ebLMKdkwiP1Sm9EN48zDb72NJ4+igLBYIiUbZgmpv+41mTbEmyefqpCniBpYCU8z9W6sjdkwylz
	cojuLoh/5H0+wxPP+JG7MBC0yFveScVg=
X-Gm-Gg: AR+sD139uVFyt5Qc+0zTnCABC1deHcwJH5iIw+pKfBaLXTfxih4vBkyWx7INK01SskE
	eR+TYIsS5vs3MNTqMfYiF/sckD0h3d0P5o73HxK+5ZNWs9RIGXTWLRwPjIYAuifGmw45R5KRoQV
	tD2iIJJySnEe4f/q1lHtpTcZGjbbLhzXb2HC/tib3tvj6d1OdQc+xeIdHZY9xi/RA6nmg0WedYs
	yEUt29pKSnIbQ5igmIpQ4zM4yUYSVY29yZnUdNgCMsjGxcBsDLTaswBmGeWDAJ4YyNfQhTF7ij9
	q0QW9bAIa9bp+I2I5jbm7iZJjWQr3BJX7YuA+aFiZlKsPFMh1mTkThHR88sDfS9fBSet9pjIzOQ
	Jq7Y1u5J1IGO20c9LC/db+DIAso0QAkDhuHs=
X-Received: by 2002:a05:6000:41e5:b0:47f:7b75:9dfe with SMTP id
 ffacd0b85a97d-482c0b5bf92mr8558786f8f.8.1787310386687; Fri, 21 Aug 2026
 04:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aobjCr7ZtpLmL3VP@ninjato> <CA+V-a8tpo2Rc9xsvsj9LLqD2ZjoHzRAVsox=7xURAtwA-GYVEw@mail.gmail.com>
 <aogbk-moFmTTFkJ0@shikoro>
In-Reply-To: <aogbk-moFmTTFkJ0@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 12:06:00 +0100
X-Gm-Features: AcwNN1UGmz1uUQCIu-LKe-mxUq6Df2QcPbc9ZZ1iJn0ahM-r4uBoryBwB3wI0p4
Message-ID: <CA+V-a8txC5U_VvXBYnMXctBg2Jz3a44NZjn-P39amUq5HihG+A@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] rtc: rzn1: Add OF match data to gate SUBU
 register access
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Aug 21, 2026 at 10:34=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > } else if (!data->has_subu) {
> >         return dev_err_probe(dev, -EOPNOTSUPP,
> >                              "No valid XTAL provided and SUBU mode not
>
> Yeah, looks good to me. It is maybe a bit hidden that xtal =3D=3D NULL in
> the above case. I wonder if adding a comment above the return command
>
>         /* xtal is NULL here */
>
> will help understanding? But I'll leave it to you.
>
Sure, I will add a comment.

Cheers,
Prabhakar
