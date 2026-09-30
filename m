Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4022A5158B7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786745; cv=pass; b=SQdXJZXVFrY7EMYmmG70oMu+8Q3EAZsRQSmz8JeQR1qgGMM7AuGXyhTB1VbJuCM/13T0ah2c0hhcmu+m3457xjGq4jLjDTMm9ZGqz6QupHjYh03KXba/Ji4X5t4qKIyBcJMSDn0vncf0o4fkTUhgXs4YMstzNgSLb+ODJ512yWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786745; c=relaxed/simple;
	bh=bhyLwLX3Cbs39RNIdfvjdkMauqLBTv5+SoflpxyeT3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwG7289louxwqabL+c8rbHABRARn1UZNb5r4b8PCm/YtHz9La56T1OaQcz+uOpWM/bBZNRWUEE9tpumpxrTLk078PupgD7TUm32DMaQw9Q8ytwa7FQdhNicrdcsyc3EJLWtg3/y34mfcmIuYbqfV2Wz+dyQql88SgwIN1Cw7o/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knt9JlSv; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knt9JlSv"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b05fdb2f9so132115f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 09:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790786742; cv=none;
        d=google.com; s=arc-20260327;
        b=J4WPbG8aFPdWXW8HrdFJQwhrfPZw6lpm6yeshtjbatgewqGtfPg6bUyqW1sxuM/rrN
         iJdhlGACsRr4n469PsWby3dsg1U1KKuX0d6Eu+QrPNScuXY49JmPSZ2Evpl+ihaFeemj
         WPF4QExinWeV5IMOmTacW7xpnsAHJx9iP4DgsJc4edHkpXmcfax8BxA+5P/IR4ErimiR
         +dA1OUWC8g9aZULQCiynKlQmcbHg8Vok89Lx2pMtdWaPlwMUErcklXMQNRkpK5KOCqsN
         Qlk2zyFcOz+HcEi/C7xUyZu0hMCJOHqUFhoKH9JQ/ycMsPVibDMF2ebwjfAhHejgMm/D
         9Osg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0qr/Ipxr22SFcNZfSu174bMZPRwg/L3HUY1rLAYBi7I=;
        fh=pwGfS7tw64wwgoaNW0RUFyn/sz+XTpWcpiMxfhG1fno=;
        b=M5lDoLh4UyjrSLj5Vode+MVIgt653algnoVq6Qx5l5Giy5qSW5eq211MhS6nv7iMAr
         aVB6Z9aXHAUp3DNCPLYIesjXsftow8FObhSItobEg3t+P00M9ID/PqJGXRgflVJODyHx
         tij8aHrSsySFABiGVMYDSVV0NLa6X2ASaSD1WuhSK2uh8o50fJpAkaE/wjg5FFU9UwUR
         UASELBCJRpoFsL5JYlSDE/Ycddb72qfi+lcioIhYj6JpbPp9/9Odlfic3WnR8GE0m+V7
         owKdkxQAzTF8i9cyVr8cHRKvWLVLF/MQvO9yAsVx6KUBqA5BBcpDIXF890Rxydt6HTWV
         RRng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790786742; x=1791391542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0qr/Ipxr22SFcNZfSu174bMZPRwg/L3HUY1rLAYBi7I=;
        b=knt9JlSvHA/ihsQPnXC8Pto5tXIsmr4YXVA0pm0Xeq04GwRzp6MsVZB+aY/hHa2h0B
         yoUINlKRc7bS70qcFZbuxmrJdB6q5eXGOikRuXFhxbpGHqoJhTwLYYEF1UHagKwG0gXy
         smgn3xzTfk8D7fH3T3hp0/0ZP/6h+q4/t/IOMcqsEqYs+Kt7j6W7oyp1RV3y3BIPeQfv
         ExJZWrWTNyXvM4UOF/MrFQMgRTZglQSFgAR+ipYkC4v1+FyStGbHL49dSKF3GNXc8TZp
         XHHNx7oxo1GNGTpT8zQi/WQk9KXrCuLD885xnE5/KnF3WygGxo8SMqjrgsi/S4AjuqUC
         8rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786742; x=1791391542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qr/Ipxr22SFcNZfSu174bMZPRwg/L3HUY1rLAYBi7I=;
        b=TGRw1OHioQVceSYDXTBFD4/gJ7Frj4F+aVV0B4DPutzvJrid06aLMwLNBawQqeu1RF
         wbpWl/py4ifEo9YCMV92608mgSfwIBF8oBk+Sc71OVulqeunDEWRAbPf7WixoOqwF8xe
         /NtRKbC1f093MZTDjEIVaggKQpXjBwb/WBQbNcXAfh6AZUvbaXOgXys2aIm4SDYqsVWq
         DtUhyviWuThUFWjDet69/Yu1ct2o5eQ6ib24H9KV68dVT/SVgTF8KrgvjDn18kjQNgHF
         41TS0jcRgM18bgqkb4/W22axq6yU0/GJ+QG7nszxFulA0OExm6g3AjGErNKmE82ZKfoS
         +LZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn/lyhrHN8C7pfhtKMLte4PQ9PcgHQ52DoDg0l+Cj8Q2l1ps1mHA56z+ApdkgK5MNIKxnOmdTEteaCveG7TlQCPQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI6y5+C6Xs++jnJiAyfMM3BxFxkPH+imvxOwk1sGPtj7/AOZJcQ
	ZPe6X1MFUWBiV6WBg8PpZIJ49my36E+NHMI7hOEiJmafsqWSdypMg1NPrXkEuR8pU+M4RN1Eso6
	2oxIjjc2/wxbKqXPLASZZTw3EVhAcFIY=
X-Gm-Gg: AYBFou0KUbFEUeZZv9tJ63ni+29UXeaniTtAm7b9R0guztfPKxjfei/qSxjpnQESsiX
	KiAamy3Inkp87iBnmCvY4sWUORQI4GtJ3YhTmS6yuonNlt+X8nrNU3mcfDeCi2MxF/CD/zms1vM
	wsjuWrfaWbhB1/0acdla+ozHDWlCqRymZi0AoKcbUEBbCn8WUG5Ei9NzyWmrEDzZtfzSH8SQ+K0
	irwFmgV5HCHVyQAEYV4ug4h434xwIX2GvKeQy0KiMffBJ4Ki7Ld3Np9OYGLPsbCEeUcTaFJ+K9Z
	hWEcqfmNRyXGxtNRoRYm9ffnk9KbyneUSz2YixYjYOq++TVJYIDT5dQBciY4l3DQnu5B2U2YJKI
	uhhzii2CbL2m8S3F9hq5E7zc/TfLYdaKK2jMNFb7yHjuybviuVygMlaYMmX3q4So6wqmiNGFbNg
	==
X-Received: by 2002:a05:6000:4a01:b0:48a:f36d:fb57 with SMTP id
 ffacd0b85a97d-48b024ea6cfmr4110706f8f.18.1790786742198; Wed, 30 Sep 2026
 09:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzVHnMtKqQx5rdZ@ashevche-desk.local>
In-Reply-To: <arzVHnMtKqQx5rdZ@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 17:45:15 +0100
X-Gm-Features: AclHuK9DK0fHm8pKCkWA6Zd6bNeQSmhN0p4rElp5jeZV36-WUljPpymXoO3Fm8M
Message-ID: <CA+V-a8sgRHDbJqnp6_-0NO8V5f-J96ZtdC698-2n0Z7n71x5qg@mail.gmail.com>
Subject: Re: [PATCH 2/8] iio: adc: rzt2h: Wait for the analog part to stop
 after a forced stop
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Wed, Sep 30, 2026 at 10:24=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:42PM +0100, Prabhakar wrote:
>
> > When ADCSR.ADST is cleared to forcibly stop a conversion, the analog pa=
rt
> > of the A/D converter can take up to 2 ADCLK cycles to stop operating.
> >
> > Wait for the write to ADCSR to complete and allow the analog part to st=
op
> > before reconfiguring or restarting the converter.
>
> ...
>
> > +     /*
> > +      * When a conversion is forcibly stopped, the analog part of the =
A/D
> > +      * converter takes up to 2 ADCLK cycles to stop operating.
> > +      */
> > +     ndelay(DIV_ROUND_UP_ULL((u64)RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC=
,
> > +                             adc->adclk_rate));
>
> I do not see the point in having _ULL (64-bit) division. Do you?
>
Agreed, I will make use of DIV_ROUND_UP() instead.

Cheers,
Prabhakar
