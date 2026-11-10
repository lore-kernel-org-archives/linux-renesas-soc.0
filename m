Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794313347;
	b=HW9CF/iq685/QK4bGgnfC5w2HF+DTtD9qZiuucpK9YqpFTm2wojFWd3Y/mLPl53olwZl
	 0d+jwq0ApW267slLNrPVJFxxaRbSH20Bg2S6+8hL3Pnmh79YGPKlllRd+3KAaBvN9dDjo
	 WYf+cB6SJYSUi63D45MR7y/otUb4riFUwDVpZgQ6Isj6Nhpk+xJQrfehszXSu6flPAORc
	 WXV7qDmUgTIYN1mLfR961mC7P9A5yn7QTyW4oD57fA1C+WV1Fxj0Sg2AxARKOiTcYqA8H
	 JXTwV52rm99RX0q8mLJHYjJfzjgRvUk5eglap9L3kVWVRGFEogxNqHoJ+4QtrmeXmZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/+MHJzkrQTBa0PMMy0ZmVpPU2O2nIABhjZj+wACly9s=;
	b=m7l9MxXoZEc9mesMWvfiHqj9g6pTc7lig8Dvc/ZmasWb2yi7o2RgkH4FO3fWhoetYv//
	 rjGMFboY+B3K99hb1HfolLZhuadIcINqv06y9iWxd/2xti1r2GaGqiX3SJUeJC0s55xfk
	 0ftVAlfpBWRp+c1KRwoDnThKwfEbMcm8gAm8XIIb8h/P39koEutGfb+5L+wO2tHwNAX3Q
	 j7r9ZyNEIruenv/qQDmik8QYbl/5hUDtA2Fv6CUYUm3WEcs9AOvJEK6/0t29PAIqm+Nti
	 QXOU4yvSFG5nHYXbSYVTrQDswxxWX+b9XUZMqwPHED3au6wGsqXodWtB+OfMOLlVDUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjIesb2f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFB3606A335
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 12:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DFB3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjIesb2f
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so1890725f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 04:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794313346; cv=none;
        d=google.com; s=arc-20260327;
        b=UpowxOdBHFaR7DCcyzXlxPaRqeratXBHQxMfoayg8ppzHMGn1llKKRyd++PXJxdkrw
         3G8V3BMN5NsXTT5oR74K0Qt7c4x9R/hITYhWmpq1HaADfEukQ7D30A27cxInO2zTXp4h
         C24KfANGckdJ/CmoVltenpPS1/s/q/BgPPijEr+FkAhBqm+HVULmQZKemZSxt6nT8tBp
         6+0J2qUPl+5pOcB6ye6TNs0fH4cAZOkqKgmFAAms2Lte97symiLFYZBYwB5XlAHjDwDh
         g1GcYLaV3PuY8FP1HJmuywMIrnKROl2ewmErRHHhaOL1IgWD7pQ/8i5ZviXNUTSLwFn8
         KB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/+MHJzkrQTBa0PMMy0ZmVpPU2O2nIABhjZj+wACly9s=;
        fh=lYNjshgZ40vDnIACwyKObVXGYd2vdE79WJ/wA0d2HW8=;
        b=GxJiJA4ylgOiJf2zoMPXpkz7NajSjmQIsz1glNhL7vHz7LsNHhSivbw6Ga4QO8mVFb
         wbTFfkUoXi1qylXgIs5Ct6HJ9i7FffnMyOzjtfr0U/13VKMrfsfbJp3xMMHy9mlLNSNt
         WHrsDf7Q0OBF/MjSr3xMtVwfhgnL6RtItt3dTEKT+aPeLG8R1eWj0de4+gJ11biFnvUs
         pOb3jDGxYjtCloFGJqfq1FBHvtE15XyIdiIorUszrlxdZL5JiFW/hXBORauguVzFD6mJ
         fMYVRGLkGW2Z18efILdKCQrV6y9w2SnGfNaaEJkRHQBf+qrQnyuEfxVdnz+JgcIr5bIW
         ZJlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794313346; x=1794918146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+MHJzkrQTBa0PMMy0ZmVpPU2O2nIABhjZj+wACly9s=;
        b=NjIesb2fvuO6xRzD3T/V0olRS91tgkrcYm0RDXEV8CiRJoLdL7ApgkHSbxxS3v7N2i
         c+22xEBaPoK3sQrxQRrZKiDb8v5K8gGqtVjXOPa0FfHXVGCB1//kosh4Fs7bHevbHDh4
         v3y4l9dMKDR58cYGybZjw6MjcOdMt6GmHs+oneJrU/FHBE7VLtIibgaZ8/TB4JQrn95R
         piYq9mZmO6qbHmyoICG1nF6UweubbeJfHZ7L2fDjq1sdJ1Lblg3hWQwnBq13MUjwlOxv
         NMoVt9cFBrjaZV/4P+5oP2XpwX3TUZ1kmSQZ3RGcyEx7qkigIOKZWBX2wjUoJa9Z+Pz9
         IKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313346; x=1794918146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+MHJzkrQTBa0PMMy0ZmVpPU2O2nIABhjZj+wACly9s=;
        b=1ZFudtldGrq9JW0PIaTXtGT8bCArzvtkZBeaKB6/dT59RqQW19D/voozcFQyBmTEq7
         BZEWSCl+VyCyHxXS5dhj8p59c54FvnANIU8uEy+SDP5dLWn0JJp4TZoIEx+VM7IQd71u
         B76EJmnl82BAtiSI2u1ExBgdBC01lv12NI3R/4bFrdj8+N+4RSDIVC5pxnIWH0pONBkw
         ksOdYnUrMIcpx21vpXf6VMMkea3cLK7QC9BIl0bpqYnccEzcHUFudJROwjg1fYkvD4vb
         dnkAAA54pCGzncufpCtZkIW9SDT7Lc6ew/FbnwW5MpV9/VrIaBoR19a52Tg3Mz4MRZx6
         7aaQ==
X-Forwarded-Encrypted: i=1; AL+hErGJFnVrta7Y/mr4CWeqlXHfdEtUwiLUQ2PXrqx3xxfixLoLizVjZFwyui23PiqTKvR52tBtdg0dM3C1QqNYkfW3Dg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8gF55uDMTmWg+Qu4RCp4T5qszkEZSRxg7/YgZZKZpT43Fs6WO/
	zb1KBEsPQy32j7QNGoT4KgQBFAxXsvYtCeRhipw5/Cis0Bb/8uMlxAu5qiv8vzeo6ps2qnj5Me5
	vZOMJDTemlxB8V/oNa427YyfC8ajL6U4=
X-Gm-Gg: AYBFou3rAJ+IxGuY3dvbXMH0h3tKk7x8I7gQ3TyLK94mWKXtr1ca2dQZfW32kiKFGtA
	g/KQCsxSo6FGK7pjB4pzdgIoG5R18szyGJGvkZwqLt+y58r9cfiAz+yUPKw/UOEgVbXZYY49Gh+
	+/nFXf+QLNz7d8smNtRk/eE4U9eVmGOQDbzUGn8nAD46lkX0fN+XhZoLNmA0qSedFdXn6khVdMx
	T/0Mawf7DErsCk3tsJvKJpnp0BC/RI4hd0h2R4DBoo58pwQCUaJvdBBtp77KSWvwPBZ/fn+tZRg
	6C3ENYKURhTP1YJq3BS8t20t4SJ7U3+1pGjEivQd+TwVK9SHyrua5ja3TNHmhnMYr+WI0wM8zVc
	cn0enZIticN6SCv6gFIb/epMCJ8KXbhJJ7lOOCeHXt/VsS//9g6BGE81b6RBCvW6XenYaAyGTzL
	YGTc4u9+Ir7ehklleI01jp9tIWfhDnoela9Ebs6Ct+5Q60ak2z8NQ6XrSdSw==
X-Received: by 2002:a05:6000:4555:b0:485:8cc8:1f5f with SMTP id
 ffacd0b85a97d-498309ae1c2mr3208558f8f.42.1794313345655; Tue, 10 Nov 2026
 04:22:25 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110114622.229608-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB1134683B4AB5DC97B70F76FB586722@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134683B4AB5DC97B70F76FB586722@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Nov 2026 12:21:59 +0000
X-Gm-Features: AclHuK9UoXtdtc2HXij8q8Oj65-CKlwzKWMQawTDZRBatrdmul0O7w180edoOrI
Message-ID: <CA+V-a8sZovqjaDTDFUrw7WJ8kqP4sjk1p0erV5A6tDL3qZNr5A@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: mipi-dsi: Drop duplicate
 platform_set_drvdata() call
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Nov 10, 2026 at 11:59=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 10 November 2026 11:46
> > Subject: [PATCH] drm: renesas: rz-du: mipi-dsi: Drop duplicate platform=
_set_drvdata() call
> >
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> >
> > The platform driver data is already set earlier in rzg2l_mipi_dsi_probe=
(). The subsequent
> > platform_set_drvdata() call uses the same arguments and is therefore re=
dundant.
> >
> > Remove the duplicate call.
>
> Some thread related to the patch [1]. Can you please drop the first one a=
nd keep the second
> one?
>
Ah, I missed this thread, I will update it and send a v4.

Cheers,
Prabhakar

> [1] https://lore.kernel.org/all/TY6PR01MB173770FD0BA340F5A50633E21FF322@T=
Y6PR01MB17377.jpnprd01.prod.outlook.com/
>
