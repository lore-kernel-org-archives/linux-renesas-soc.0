Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F233AAF56
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 20:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787345053; cv=pass; b=Bs+4qqXnm6So0DcYzVD9axYhkyK0hlCA84NzY/2RnEasASHOZFxB7EVDI+RoBLBnxzoudcHS4jmv5IgSwN+/MjIA2Rqrz7TSp9aTb+ptr/34b3VVcvRxJMbjGKd9yABR20RXblGhmPkSByx653t6Ahfz2n9PfJAnGtLyNwJPsIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787345053; c=relaxed/simple;
	bh=pfqUIoW7PHPIYNNgFH4u6pCoFZSchCOkft0xZM8GW1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHn7XUNUEVAEXGnuv9DntFcyZ50B7vc4uXo0uVbsiXfj1I6LT+HBgVHbOTeuxWHdRD/B3nPptNLWiXHRe4boTZVYf40G9c6747TssoKRucIt50kXiaiBcix/ypymCaZctzAIklzBU7FRYZIjkBXWsHEJbnr5Nimifkw8JPsB388=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4RUZzef; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4RUZzef"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-476a130c138so1453809f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787345049; cv=none;
        d=google.com; s=arc-20260327;
        b=YMkEBhKYboU10siTJfpBHKZQ5iSGSikNh9RxF6d924dlfaMmEAQTKa5VQ4ZhTdk5uN
         +3ZU31Tu7wihT1Zzh/dyGxv71czanI8kmBG4YFEsOW/YniCk3KtXrMx6952Tlo43KRJc
         XTmKNdsAndRpUlKMrhkBdEW7nSoHhZJqk+Geptcq7a6oelTNP2jsvUk+wk9wZE8FNB6N
         jsmIVROc96XMQyFfW7y38njpDLX+7zkVaqjJ+XQ218xjIkCPqUpSqJ97ju3tsYIYaXKu
         oGuC/NjtgfFK+5CgZx3lZWEb4Ms0twDekzzqBDYpWMoJdMvk+yYPkWS+1ax/jLUtVCdd
         1Xjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+341h6DEBK5z4wanMXZy9KI3GcewBIrOEEjNnpvxUQE=;
        fh=b4HA1j6+JZ8w31DQjpMtaLCZrfp/wCTQMfmQwiNbaMM=;
        b=c20Lw+L12IbUkBalQVwiSeKScTBYoxSJXgBv5tw850W3O+OovmHTbmS8M+pNtRWId5
         lam0AN8Ki4fq4Wr7f465s9YVQxU0hu0T+cnhvm7MnIXytBLkHobCuNA7UOcKpCQ+PG/t
         eYi2QMGYccFdjnMmCrjQWUPmtytx/GrEj626e6l2LCWsS28cFzGI/tlNgG3uDSkj9/rm
         Roc9XB15R8WtVyxjj72qPwZWXFfyWKxQjfFb9QWfdYsWpmAeIG3ERt1BzMEdi1OhfdUz
         6BWMiigpYVMEpW/OGYXXQgZ5SBInn8EPy9RkOsnWg59ItdasuF3+7jDj2efO7l3U5AGL
         ROpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787345049; x=1787949849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+341h6DEBK5z4wanMXZy9KI3GcewBIrOEEjNnpvxUQE=;
        b=J4RUZzefrcYjBbdgV5g4UJmBLQK/FJeHaTUbMM5mP4bshfUBERauh8Qm179Csr7PM8
         P+CfowNPWCI2fbsUAzzwjDoJfhMDd8kfAoSsQ/EC4IhKlT+OkZe8i+QfvKv1HX4fdZn/
         OIuU8/BJ1QOgVvMgJu6Wp/k7xyrnQLhdmWQrpgdyoS0wU+A6yRCN00HQBmDhp1K/aplG
         SJo7lh+gUJP7d5DRA5cGJOlIfuhNp1xsgSKbO53UIn9Aeh1l4GZd5fINfxnHzYBlmkj3
         pkOGWiRMIdKjSnIwTqKs/bUdAgsmE5Z3ANpQiAaXbVJvtM7c0w66NVkDYs18rkk9W/v7
         GIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787345049; x=1787949849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+341h6DEBK5z4wanMXZy9KI3GcewBIrOEEjNnpvxUQE=;
        b=clyyNs3YflUG/BqG/07nmJBAknV7z+ChGfW3lJmeYz+p/0u9Pwr9H7jzToERvqrzs5
         ds+oUOdjypJdIKNDLcP1AJQosZpr10RflKvpTeRrD1nP6k+gqdf6ldu6qKPuMROsMkM3
         8+Tulj7YFfGhUMgfbsRD2XFSlK6NjP2MlaQQw4q9L6jnniOQInkyfKbPNQRVKD9/DCrr
         EzfuezwLOgStZzjnB6JrlbjyuU7rdgcFa9sAuEqnSm7WRXaXyVoouYyE1v5TWeD+rj6Y
         WooLjA5xYpl5IsToCfl5VT3h4ZpnpqziRL7sahVQI/V396e/fyIVyNpvqjZdWG2ozUZM
         Jwzg==
X-Forwarded-Encrypted: i=1; AHgh+RpLSCIpVTtA9WxUjv+DiTq1VQXFowmqLtfHSZ5GQwLV3qO9cWPz9OSA3jtl+qPq1pxpOFr+gEauQvE8/fcKGRvvdg==@vger.kernel.org
X-Gm-Message-State: AFuF++ni9snClGL8I/8JPs38YVn/yHHfov1mVmvc+eJZxLb286Z16Fk3
	m7d0Hh24aDPmtHXvKV9WHZDYb8ThUVYI8mhPLb0d7v29ip/huiuts16g1BYsPyuQY72vE03Zi1c
	aLjDr03QoXQ91dNevpAJs1cpmIbV9rPU=
X-Gm-Gg: AR+sD11hxVVrj1nW5aTwwmlsbroQgpYEbRa1dahEXv1ls0DVYQ3FKIVFp/Eq2lQU4Ql
	dcYH5vPJwkv3nEEIMicbE0iu1DLZCO8Bn///cj/AZzMDt210RPmNyhb4wDkis+olZGunh/9lvzH
	mipkzw3Uk1X6o8aNgneMnNyt75kCy6VmcjkBU5eQHVJhYCSGKFUP63MnPR6FytWLl5y7NAKbYaY
	+6mceA9TRisKVgDnXVmKQ/6x1T4UcIqpDsecBNizKs1QtNYLlQtQKS0ZA+9+fQNvGdkQj9ZXd+S
	I7COmM9JbD62Z8HFGuRmzbTUgcxh4B5GegtXOgU6kIFer4tDMEVBi3F1m6XzysLJyRLA4budyKd
	bxOyPVIg9XieHrPpn1NvzVEY5Vp/isWi32XeSGRja7MifQw==
X-Received: by 2002:a05:6000:4b16:b0:47f:f1ab:9075 with SMTP id
 ffacd0b85a97d-482c0bb16f4mr14946126f8f.20.1787345049436; Fri, 21 Aug 2026
 13:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260821135608.275233-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <aohqChLVqwiTpICo@ninjato>
In-Reply-To: <aohqChLVqwiTpICo@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 21:43:42 +0100
X-Gm-Features: AcwNN1UV5kbjb7HhnjD6pQaN2t78NxQ2bOmzAO_X4_DwzDdyb74TPzJRrq4RttY
Message-ID: <CA+V-a8tAUirxWKyCx9yvYgp0EkysxgkgK20-RArzFFKOXuHSvg@mail.gmail.com>
Subject: Re: [PATCH v5 04/17] rtc: rzn1: Handle unset alarm weekday in rzn1_rtc_read_alarm
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

THank you for the review.

On Fri, Aug 21, 2026 at 4:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Fri, Aug 21, 2026 at 02:55:55PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > RZN1_RTC_ALW is a weekday bitmask where bit N represents weekday N.
> > When no alarm has been configured, the register has its power-on-reset
> > value of zero.
> >
> > rzn1_rtc_read_alarm() uses fls() to convert the weekday bitmask into a
> > weekday number. When RZN1_RTC_ALW is zero, fls(0) returns zero and
> > fls(wday) - 1 evaluates to -1. This invalid weekday is then used to
> > calculate the alarm date and can either leave tm_wday set to -1 or
> > produce a fabricated alarm date.
> >
> > Treat a zero RZN1_RTC_ALW value as an unset alarm weekday and return
> > without calculating the alarm date. Move reading RZN1_RTC_CTL1 before
> > this check so that alrm->enabled is updated for both configured and
> > unconfigured alarms.
> >
> > On a cold-booted board with no alarm configured, the following was
> > observed before the fix:
> >
> >     root@rzn2h-evk:~# cat /proc/driver/rtc
> >     rtc_time        : 00:00:19
> >     rtc_date        : 2000-01-01
> >     alrm_time       : 00:00:00
> >     alrm_date       : 2000-01-07
> >     alarm_IRQ       : no
> >     alrm_pending    : no
> >     update IRQ enabled      : no
> >     periodic IRQ enabled    : no
> >     periodic IRQ frequency  : 1
> >     max user IRQ frequency  : 64
> >     24hr            : yes
> >
> > After the fix:
> >
> >     root@rzn2h-evk:~# cat /proc/driver/rtc
> >     rtc_time        : 00:00:25
> >     rtc_date        : 2000-01-01
> >     alrm_time       : 00:00:00
> >     alrm_date       : 2000-01-01
> >     alarm_IRQ       : no
> >     alrm_pending    : no
> >     update IRQ enabled      : no
> >     periodic IRQ enabled    : no
> >     periodic IRQ frequency  : 1
> >     max user IRQ frequency  : 64
> >     24hr            : yes
>
> The output of the tests could be dropped IMO, but I'll leave this for
> the RTC maintainers.
>
I'll drop it.

Cheers,
Prabhakar

> > Fixes: b5ad1bf00d2c4 ("rtc: rzn1: Add alarm support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Other than that:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
