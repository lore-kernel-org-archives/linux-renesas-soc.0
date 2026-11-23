Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449294;
	b=kRtx+8L9mkrkSrHjI7sXI7dhgonEZEWZFiQZ7RUogBU5pD9FD3ItmJtqJTaKOxNS+FGg
	 NQAqLJ38HmYD2t7cpexlwtWExeFQiznTpP2K9T9f4YWmfVX5tTcmOdyT9qRRXv+AVfeiQ
	 4kadBVhnhUqh3IEYz68gWyNr/UfV5L+wLbzyNjDJxxdyjRWEyL8xOzvtfDhkeLjOh3mps
	 O2eV+qIHDRGwiZGyaOalw3nwIiqwfX/5A8YpPS34EoZYZ1oYkklCOZnBAG7dfMvG6V/+n
	 YdcojkZu1eYczjZa7R3M5InWJiVfK0NIO1/LSbSqKpeL9nrflw97Umjjvwe6cgZgcOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
	b=a7uEL4QRLuHkRXZ98a3u2qEdvYwWzpSm82Yjd5pGBdyDnIvEl0qqvRm8/iiqxuAdDjh/
	 jVqtMF5P8DLbcrZtNq9+GpalC1TyL/9dfdVztpMr6L+TXeQvNhD5ZiKsTJ/lFSuRImlWe
	 ApezOSrFVfddKzsYW2yTPKeYzmwWSPUzY2hAo5/2TmWnDRLXuygZNirUwaQmqONoQNDc2
	 In4xjMJdwN0z7suWJi9YV7vTj99ysWBq7ybejBsbZaeXsle5kOkkMmWNttYeaWPsvqhWy
	 PJeYAEF0z+4B3cLXnsV5nftSuvGm78owU5lUu0yhLWQmUT+cCzsH9VPbWzPYu1xa7Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K31mtXdK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FA9606A31F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 15:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FA9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K31mtXdK
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so4793634c88.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 07:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795449288; cv=none;
        d=google.com; s=arc-20260327;
        b=oharMLRS+zlUBtsnfenNs0oRy0fo4khTBfQUv4pgKiyAjl3eDkbo8AgIOfKANVBxUu
         jL93TxdzBlk+VJB+hBW86WwXjiUUMbTZzdI0uWTOLN3qjknIoy9hovmv+mBDhlGsgEZo
         /kj5lAbaP8f/KXvshEX99KQj9ZzA+8y9mKGiDIHcr7rxr+HMT/777OpOaXqS83HaGv3f
         Ax1Yn2fx6AffqsN4dcmbSkreJp1i0ZeCM1jf+SF7Ns0Z6NSq5NGGN/tQs2k4EEYmMJSH
         cDROghJ9bxjmAjIEwkNdSRIZQeGSuMlNakRKW/fHBu2mlvRqq+pLg5T3BejaVrjoznd+
         cpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        fh=9oz0J1eKpLthSvPN1kQFtncmSZlETTmgyPkvc4MaAZg=;
        b=nEVn0W3JMoqjpRewrD3gXUY9b7Ka4AYOm8JBFK6EsIR80n68D6ljYudtgc+feLK0sV
         rMOLc6rePpfBh/FbVZE0x97eA7rulXhJZMOc9r8IoaUSEYfIN5UwrUvVNnS8ON777EDz
         NJfOjckM7lx9s32sk0Fd0kFL2sEoKbktu49C/cV4Ol/ZWCtRbqcAeR9lBc1g61D0Wdpu
         K0AmChkLsAGuVMZOM0fGGYd+qY4WBS0rYUNFvRVyG/qTjntOEkguu2INoNW4iRzq8F2s
         26HqjQpzq4IKvwsqj8khLQp71ShMGJ+sKj/bJLRy7KSzA/XeCS44l/Q0r1/1XfWPZCrG
         U6tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795449288; x=1796054088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        b=K31mtXdKcF83FLFamHn4mu2c1WFux/XDEszEG14A98Jt2rLyW5vAa6g0aQrAW3bjzC
         gllAzO506OvE/rfpZOcYCxMRUDQNB4VXopntsohEOrakiet5wYn7sGPPxwfV/CfChisN
         uYXj8HFMNtuEZ+ou9t21iBeUUC7Pic5yoPJ+xhHP/+72mh5EZsszVIGPCdywgkhiTEHT
         PWSHOr4kNaUQ3YX2g4wkBHhAis3nwdahz8TPq6MFehDLcsSCT1djEzG7g4OFRye28hLN
         CCekPYk30csF+W8hqwpRnXEm3DGytgokuK/dlh+xzWCckuPUC6BXDNd7W44jN2cXrX68
         uVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449288; x=1796054088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        b=VdssT7Cgnb7QL1McOkO/4kAe/Jk7/+3OTuyQBAz67X16SumVc22WXQV05xciOxqfDV
         lZJ9KoU++NMqZkBp+x9Nvz9tQN7SaBP/cteMSU0uIQ4NTXIOnN/KBhc/BaUAd7skQiKt
         oM/bquDLbJIIUIkCx3GrnsjP4by0MwjKHs2WvpGX70XEGhx5BS7i9XoO6GoRVf4qpyXz
         opKCxyJrCIa0zCVcsg0uxNmm3Uo4Gui/r9vbzB3Bb1VUdcQndCRL4n3X/r07Bb07T3G1
         yRvoC8K+FNmoBzq202AM9IpM6DihOH5CFurVz3bDT1Izc+i3JlF3YHVoWafozbeY79/q
         5yfQ==
X-Forwarded-Encrypted: i=1; AL+hErHdH8GCNUvLOHI4wgXf1cwGrCJJEVNTU33BsTvjbKmKfbto+uY3lCFal927OpPrVXM7I4Wl5DFOFNssmioioD9JoQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6DH69NDTKGpZy0rgCe7oPko88Iko5zeTaruBWIQ6ahQVBiatk
	z8WB5oXTWB+Eda8RUTWMHdkN7LWXQK6Rxwxfnwoouilze/6TO1aYWxHtpmIYIATsdpkFpBwxsAu
	6PCak7uUrnhC8FF+zWzhSd+FiAqRH2KiJO3g8/MVEMw==
X-Gm-Gg: AZFdTZeno3RlcwDU7GbbcQBbW6WM4Qo1yRYuXBBIYnHAhlaqW7a0XO2Tt+p8ywWGtgy
	Vah2/6K1SWgUQLVridVHj/0IqjWJIEMc3VdEG1DZGdgXz5TXw0EFyO8/Lhh984lFXQD3I0f2+EM
	nt1+iFHacOZv0DYx6/gPYhoDF90kFgxdEoCkvVcnmouX5V/5icJV0VDaZLwKjucQe8XpHIVF9A9
	adveOqBupvrWm/JPBgaupwo61c6FR1tzivlpbZEJcY82TjpFrdwE0FIm2c5Ti4pQlGb4V3DuS02
	KSPqfxzFfPNbTIRosbdkPrs5EdlQ62j2yzlBmn8LFPmu24n/JUWKZJBsM3zUqpYzovVtAcFawuV
	lD3c81XiGkpPHbSzq74wTKKu/HlyPxI+8bpoDyfkVdHq4LcZ3HkxktMgTZb3P18NCaTnaDejqI/
	Kyk5h9i0AQxWQu+8w2nGCmOLWTWcykHUVPH9XTEV24JBgllsia+Z0L9xjhoJoBDUetp84qKesBC
	gQ=
X-Received: by 2002:a05:7301:e103:b0:385:496e:80ac with SMTP id
 5a478bee46e88-3856fe59334mr13784647eec.8.1795449288031; Mon, 23 Nov 2026
 07:54:48 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro> <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato> <awGV8BU_AfaXQyBv@maple.netwinder.org> <awIMBj_7OLrlM5G-@shikoro>
In-Reply-To: <awIMBj_7OLrlM5G-@shikoro>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 23 Nov 2026 10:54:36 -0500
X-Gm-Features: Aa3M54odzMyo7xKMWSU836vO5_C9zRbLplW5YRgzXWccrFx6zqrBud8_l_A46R0
Message-ID: <CANp-EDbNxWnpjXDshVhPEwppGu1cf2V2UBO+hk2NtFDFeqCAdg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document reset cells
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 4:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> > Thinking about it some more, perhaps instead of using 0 as the special =
case
> > for "no parent", we could set .source to match .index. In other words a
> > clock pointing to itself means "no parent". Worth changing?
>
> What would be the gain? As you said before we can't update the values
> because they are already in DTBs.

It could remove some potential confusion about whether 0 is allowed.
And perhaps more importantly, it would make consistent the .index and
.source fields. Having one of them shifted by 1 can be confusing, and
could lead to bugs.

Ralph
