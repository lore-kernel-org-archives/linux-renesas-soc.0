Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC27841F5F5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299277; cv=pass; b=NZJd/K5ORZ1UgGbEOiek5onEBp3Ecj01IbRTNyNxebUNVT8fbWaJcLqB1YbPanZVBjtOQMJ11IPkaWBoBXxxbjVpzKV6RTeaFG44AGDgLvk99J/bXivlx1tCteIzxM9Lk0tkk2BwZ+mWt6WCK4K5n7VO6TGb2dX2nwADAMI0/DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299277; c=relaxed/simple;
	bh=U9fW2jiIlgiy2XPNBkMcmqoyzd/7xupfaic+yOZJQF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJm3s6yHj5Ftf6BVSEiRDAv+QCzII2uFEgBhTH+bIz9G3sNRXVsuQlSiWeE/wQRo3tpJkUUaLu3J6FcclI9mwfdIWTnGYSg7ikZRTjCkNUMkUoqXYoTAPK3DxiPiS3EYIqmRyMgGpMNIJZr425M9T4TyqKaXcMxzmWCl7h+ErUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRalVaau; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRalVaau"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so3982275e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 01:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787299272; cv=none;
        d=google.com; s=arc-20260327;
        b=DFQmEGmls3U/S0Ofmj17ynew1o9npzqGPqQgCOPk7zJiGyvJgf15NYKTfA04TlmcDj
         cwapcgpcaWuxmbe5qoq857OetVN+UCWoKW5NnHjIgZgAGjZ5NzcPa/2JyO7rvmpGSIij
         YVDJZZAd9nuOe2AYhGUFOhFAiaHZbfShch3X6jdY0R3vosbEf6y8AoKakefShinLoNxl
         fWIyD2R2atn1d4dtpbrXk+BxL6uIa5zuiPSiZ30nSRQCWX0rEjtx+Y82A5bV4tqSHqn1
         iUxWYN8xddkH4l74cTT4aDDP5BunVRRUBBobBe0oWx/UoYhDOGmTkg9BdZMFczHFP7n5
         YRxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKPWxLRibVTkF5iNiz5OZvS7ih6dW481F+oBUIMZp1Y=;
        fh=T90FSYnXa0pTb3kjSDHzhnLG56QXa247wd91ETZVwiE=;
        b=rumEsuqHOZZfsV52p3gH5rOsARnL5De2qt2f4ryQto4JapkyZFyaQWs8O1b4aC0Esf
         3/KzyA36Z/hDesd/VuEaV5xl8bsMKz9tdnxn6vtvUOpHtKDxeCSf82WT162ox7SuY/Re
         St+UPo5K4BTeVCEwW6+JsNS+SKdxHbh+QlDcQ0jLeHLqKJz15+ZX3RFXEbmxsZf9nlUf
         +nCywmepamf9mhhvhIiyY999GjArBAQ/QSo5uuM9wKCgLPKAyuanazvdl+BIKJdwJbjG
         12zs0jpCQPN+92y5Iob0Jd8sJw3GWXCswLvASnVoyTwwXtyqvrtrfcWfLQcw7w8Q8fS1
         zp0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299272; x=1787904072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKPWxLRibVTkF5iNiz5OZvS7ih6dW481F+oBUIMZp1Y=;
        b=PRalVaauxqYvmik87uJ22HYTJ5PVuJtJr1516MKaZhkGQgmzk2hieAoH3YiPKzF529
         0AMK+/LZAc5hELwACRj/riNzJxj1Rr/BhpDxQTtDvzzyh1I9bg0OsFUQXFtncIUd2NQc
         1FC6IYHD3fMUDNr1xJyEb0FGdhTkAjB7UD2L5dy2xjwL/FbeXdxsk/DHJQqH7y/3/bdN
         0V2cS8Q3cif9w78iKi5o/BN+NsgdLpdBtXuqkkuHdzsRlpc9VS8f/mZpdtBbkGe86hfw
         GemE84N4fVlbefBg934ONbL5iJJsR5jLZEif/lad+DlEHcQxvgiTa0tpXCjGl+Y33ae5
         qL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299272; x=1787904072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKPWxLRibVTkF5iNiz5OZvS7ih6dW481F+oBUIMZp1Y=;
        b=O+TMUFyilIKBBYd7TF/4xd2IWKzJRvauWx3Xr0nuK4WPT8pfM/7t/PBooAjjFPhoWV
         qmMpgK4g2z0En8ya2MhyevZR6uGdBJ6xeGb/yrLOD/1FON4431ydQ/K+wuJoi9dfJOU8
         HTt6ghKfQZGjxq6hhXvEwnHT323ilAY2k1zuJkwfBE5Tbkvf2XyeawEbzGbzejDof6Z8
         Aqmvy1ybRj7DA6+vpO5a8sR7An+R7uCijWHJ4ui/cyw/JyOfQadYHfphJmOhVQoH09gD
         cgPcn7Rl+YtTRUlYpvWEZe4ntfIvxA+mOUD7pjvxURS2DUMVTve+rVpyZKlj1XHjHRyB
         fp4w==
X-Forwarded-Encrypted: i=1; AHgh+Rpif40ZksCjdlC3vFWFGvjubaA9X/whwd7ayDSKxY9Rm7axvIWncx928pbZaV5N9xETvWAMvGGkqcJfXe3kxI52rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzic4ZtpDRiWYoLqI4mviIuG2UL+FfSCWumiP7x3nAMLzLXMCXb
	pautulFB3KulFsQR9u/jCK19LXD0DwBXu0L19PAmfiPDrdUeu/sWWCl2Qxv8axON7l8gumAc6EP
	JcTopSy+HNVQXuTWM1ysIlYxtuqLa7zo=
X-Gm-Gg: AR+sD12Ma3ayY3ZULubhojPaucRDdWSE8BmJFy73wQyNOcN51yzyzdU99bNGSN0muTD
	EA6jsNzKxBdXvRi6h06S6/q/d4fXeVcreQKhTE4LxSCzmceRUgXuhF/9bRDGTvhpAB8MOM+9aLs
	YFK4jL0sEA8n0XfB57IuHV8QPczwkiMxcOtvhG4X4vzKAPAqmlGhCObNh19pbt7tIswFMVfVRXV
	ZSBMvKyIBn8Bk3QpNn8mZdgD9wwulcZa0gHA4ntt3FdIqLEuFXf4Bpx+V231nWQLfmEWa62VTPv
	psnONrN06rgfw2FESt7IPgMO++t32XSOWigzUenr+gHGZ7yIu86LPhCJb337l7hAmQM+pEKfN88
	MGkO3sYBa07bZ/WoLRLC5vaqQnETTEg==
X-Received: by 2002:a05:600c:8b63:b0:499:7f37:cb74 with SMTP id
 5b1f17b1804b1-499b06a36demr106804725e9.1.1787299271891; Fri, 21 Aug 2026
 01:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <aobjCr7ZtpLmL3VP@ninjato>
In-Reply-To: <aobjCr7ZtpLmL3VP@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 09:00:45 +0100
X-Gm-Features: AcwNN1XaqV7v4Jl4yl1cAvUjpTPOAGoBa_Le3wz-UFXRDSKArINsOqo29E76N9s
Message-ID: <CA+V-a8tpo2Rc9xsvsj9LLqD2ZjoHzRAVsox=7xURAtwA-GYVEw@mail.gmail.com>
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

Thank you for the review.

On Thu, Aug 20, 2026 at 12:20=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Aug 19, 2026 at 11:39:24AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/N1 RTC driver selects SCMP mode only when an optional xtal clock
> > is provided at a valid rate other than 32768 Hz. Without an xtal clock,
> > or when it runs at 32768 Hz, the driver uses SUBU mode.
> >
> > However, the RTCA0SUBU register used by SUBU mode is not present on all
> > SoCs that integrate a similar variant of the RTC block. Allowing SUBU
> > mode on those variants would expose RTC offset operations that access a
> > non-existent register.
> >
> > Add OF match data to describe whether the RTC supports the SUBU registe=
r.
> > Reject probe with -EOPNOTSUPP when SUBU mode would be selected on a
> > variant without SUBU support.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I still think, this code needs a change:
>
> 454                 if (rate !=3D 32768)
> 455                         scmp_val =3D RZN1_RTC_CTL0_SLSB_SCMP;
>
>         if (rate !=3D 32768 || !data->has_subu)
>
> otherwise having a xtal with 32768 on a SCMP-only device will not be
> accepted despite it should work.
>
Agreed.

> Haven't checked if that could simplify your later has_subu-check or not.
>
To reduce the checks I can add a else if check like below:

/* Only switch to scmp if we have an xtal clock with a valid rate and
!=3D 32768 */
xtal =3D devm_clk_get_optional(dev, "xtal");
if (IS_ERR(xtal)) {
        return PTR_ERR(xtal);
} else if (xtal) {
        rate =3D clk_get_rate(xtal);

        if (rate < 32000 || rate > BIT(22))
                return -EOPNOTSUPP;

        if (rate !=3D 32768 || !data->has_subu)
                scmp_val =3D RZN1_RTC_CTL0_SLSB_SCMP;
} else if (!data->has_subu) {
        return dev_err_probe(dev, -EOPNOTSUPP,
                             "No valid XTAL provided and SUBU mode not
supported\n");
}

Cheers,
Prabhakar
