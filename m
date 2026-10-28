Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180873;
	b=LXZn249sDsGr69mtm1zIsfeRmdtWZWF4gRQesqa4hiHJ/PSd8Y6JQ4Dc6Un5BNCeHpAH
	 ilknkZhNNgonfguSdSRJLoJmFlJaKZPXbWLvv2szUHtZavJMO0IZBr1aX0YwSud7OgDnX
	 QY6oGUeD0STSXv6LsUdggAeBH7TPxq4UqBPojwYXqmbhjyIJUwtX/tTGJwOQL93QMUdaU
	 CjcBw59c0/Icqjj0jiuGg4d40CCjJVlu3V2Dm5C6vJ60u/BovoQPS/4fdbLSHklXxnpiy
	 f/MiDJRsB/hz1EVTMYYusROHlmCmvCBQ+lEX/KEVAPGawt1f6S+Lqe4kl8i0fa0CeaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180873;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i6WwPrncRptE8GYzBIDI4FfU9ppzTybRR7dkLJbVscM=;
	b=i4fOYsBFH+fOkGAgjhV4qHEydz38pkqs0GHH5VM+AqDPbuqsKKrRHQpLrEHAPKw5Bri1
	 +HMiCcD8ohBOI/qC/4T0Agl+LhUtOE28lvrcE/WGvUSoWSyB5jzvKH2qiN66DEStbqQUI
	 dLp8yweSqr5iehetf7S2YdC2fQ4n6tSUY+mOXuO22xd5x94ba4DJUhSnC7Gibux2ozcEr
	 MXs4KaxnojV3r4iLpQ/a+E3VuifJymU3urv9uAfNxDQWyG6KZeZGKQbuz5moJHXhUy6h1
	 Li1cnlv6TG9CuzVOdm/lldYR//GN23jvX9DD3yueTQGCW482aYc2lDfi83RlWOBygTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB4C606A334
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 09:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB4C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eaf34452a9so571701e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 02:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180872; x=1793785672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6WwPrncRptE8GYzBIDI4FfU9ppzTybRR7dkLJbVscM=;
        b=vwP7ryd3p+QLJ0B2y+hxnhTdSluHRBl77Kn5OsxJw7PzPMI1ppctp7e2WYb1PglFAz
         6LdIVlmVGT2Xmv2+m/F/mZQWxpc3GwXW3Fz53pHBEQH+Ms7Lq6yGrsn4E2G4XTn7imBA
         TTxXiCTBnTGfhLNDXaNDpsJc6FF6yd2JzxzRfIzbA6JGHASVB/j9LlyjkAbsXRb/3Ef6
         5BI4kI3Fk7WDFfgvc+OS9YEfKgo/c1OV3o6yIkpm4zq+5T41x3GwLN2eUA4IGAEExRnH
         hCxTuxTZV5QyRHcR7Zcyi+JiY7xUw1arWDJguqT/y0q18IyJQaA1eXbxSiNnQxH45W5B
         gKVA==
X-Forwarded-Encrypted: i=1; AKwUvBy4eWFGZ5EH0ue1RSIub4Nzm5whBkdx5q6mxksQk0UTPQ4RgN3qNvndGHFWMOSmYhhzkqkm4JsUTgKEd2nHFPqtkg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJO5SBB0e4vD1YRVUSBSFxZO8gBAZCdEeu4hY29Of3mu60Gb+GU
	fsJUZCTlGpP0uOLqfigdQu0Yenvu0fml2M9hTXk1XZOu7TFTOMwrD0UcV0/r2DQU
X-Gm-Gg: AYBFou0jB/zkIRVuRDcRFXfcuHRR2+S6baKskon50Rm+VnNP4rT8gIKFu8R5aDhfFsV
	6cOoy7Oq9L9Q8sAeh91j3WQslVgUSVfl7H5Eu4sxFL2Wm18g5iTLadVm9mdJk9PGNSez4xwiUFc
	nhHpMCu/jtO2Wk42thM2rDcCaq3hDzCVEHl24rdaQY504YXXIVWOmcclVe60hfqLogvySKJIL5J
	L4OedzaDUd1H3JTYKK9St3iAwMor8SLJjtxTKxhKJ3Ca+fI7JCw49sjRGMwAnVbkxq1yAhrLvxC
	+9an+FdwqngQpveInNQaoCv56tQXYprXVrg1/J9wodPK9T5m0kbdzoY7ZGGvnBoXxbWbXaFEoUg
	dFHnlVu0rcGiy2KhrdoajEZ6d70aWhGu46vUiKH7Q2i9JrBzoFU+vcJkXMrYrfqEcZoNoVUgG91
	HLf16d3eTUFCvUBke0fZPUCBeA1ri6/F5MIUKgXKJCqLF5tM/mQHdPeejWQ6CuasonNv8p6LOCF
	hUk69KuZCtsQ2hMQvYrMYmHYJOveeEkWLAXCgvS6fYXm7pEwAzi64GKeXaN/gLiwyFkc3c+JUAU
	obRD1xnFY038gHmJwCUCMCJo+1ptoYRwHAcEAON1x96OTzr+Z5mqUD52kgdmn2EkE//nLmfvfJj
	JsNURvsc/BI2G
X-Received: by 2002:ac5:c0de:0:b0:5ea:d2d7:37e4 with SMTP id 71dfb90a1353d-5ec3ea462e3mr1249167e0c.5.1793180871953;
        Wed, 28 Oct 2026 02:47:51 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f909163sm1221666e0c.7.2026.10.28.02.47.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:47:51 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9909e82513fso574003241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 02:47:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmwHsJL9w7g2uGS1O5C13h5z51jk73imJVK+8DXOie+U04CjYg3Q0pyTvvfS8YnfXkBVXKotML8mVOJpVaZ4cDkw==@vger.kernel.org
X-Received: by 2002:a05:6102:a4a:b0:7ce:645a:139e with SMTP id
 ada2fe7eead31-7cea1529d88mr1771764137.23.1793180870303; Wed, 28 Oct 2026
 02:47:50 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed> <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
 <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
 <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com> <auG_dr3VFeWaBxKw@zed>
In-Reply-To: <auG_dr3VFeWaBxKw@zed>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 10:47:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYXn_tZ8r5Her0y-TYfN3qd3DZ0JH1N3_fmEUHh4e0xw@mail.gmail.com>
X-Gm-Features: AclHuK89t2jEOgptSQIEsLA7Aen2x9jD1gfdTZXyhURhxZaUPJB2xF4KJi3cnsI
Message-ID: <CAMuHMdUYXn_tZ8r5Her0y-TYfN3qd3DZ0JH1N3_fmEUHh4e0xw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Wed, 28 Oct 2026 at 10:28, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> On Wed, Oct 28, 2026 at 09:38:05AM +0100, Linus Walleij wrote:
> > On Tue, Oct 27, 2026 at 7:39=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > The driver uses Runtime PM, but I see no calls to
> > > pm_runtime_resume_and_get()?
> >
> > It gets grabbed in *params.c and *stats.c:
>
> pm_runtime_resume_and_get() is called in the .start_streaming handler
> for all video nodes (capture, params and stats)

OK, but not from .probe(), which does hardware initialization
before that?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
