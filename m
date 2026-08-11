Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F991FBEA8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 02:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786413748; cv=pass; b=S+P67d+xAmV9TzERN8xLqZ2fuqmdcCHDUh6UwavmNh5gPUUodFgvyR2NfBtU77USRqxrouywfJ2YbrynkQiu9GKQSrutH710xPkrNgQ6DjsMfB+2hSfMSMguH2sM9FjZnVYNbSNHd9aa8L8AIxdUhXura9JMqsDBL0fMk9AtbZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786413748; c=relaxed/simple;
	bh=y3aVQsDghQY2kqVVbN7I258OZu2z/52XifB3SugTRdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQPyMnn1zvGdxqVb3SFQ2xWKavJHzSHW7nBpu3bL+vKdaThVqHwai/CSkS7klG1/+2pGGzMK7oeXXI+/a3pUUee3aCmvFqalOx/SQTcq6lxiW6FU+JX5Ozf8YWnW2n90ri6uuAkKOIBFWr1ih9dNhf6zStVKsQCebsDdO0TpRfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3mfgHk1; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3mfgHk1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d032846c95so32345925ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 19:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786413747; cv=none;
        d=google.com; s=arc-20260327;
        b=py9fLRGbpJuvdtaGO0+sHz+kSY79luhFV1V8zCTRf2Cvfa1hnaMTb6TIOeHmrZ8xcS
         t4m7FKWrE5W4B5FgkHK8qZ/mQyG2rALQOlUcI092kiiQ6X89hOMf5AvT0wkjiFBjer52
         HIoidwXnHAllBuopxAPmyU95X2GknwvgFyGryQAZuZ83+Sdl/a3pxGu3jHyAmq660q6n
         HXWQKqQWXUID9wpneiEQ0mfSLkilYngWojx5b+BHWVCb5ArtasGCxnPE0NzOxN1gSWKZ
         SG4EBBTmUWvpuGKgh45swEmOp9Hir/VvICUBAIMTaV2U1ZYiem4y5JupNoAnwRisC7p1
         7hrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J2ie5zT76vulUOKxlmSFoYHsSNdJQnoxvireTA5JYWQ=;
        fh=Ex2Jp6LGLzWbCepSYBU7ZAh/1SqHvjmMTo3GEEe2izY=;
        b=GoMPDvdZLSooq1sqhgU1w2KjS4QMJix6Pq9NWnNQrgTEwQMrmyZlZ7mrp4gb92VSDm
         K3iFTkQ9ZXJrmGzf+OexJ7HMdwipPjaJD6886LZqptWscBLSPNOQXbqO0pAS8JpR+DK7
         QQ5FH3GO7P2yemUeJmv95xjX7xkElsm7V+HC7noRFsT2bfmmEi/8cBGTdX/mMxWrnOFd
         eRBKfrcgSLs81MvAYRnJkenol/2hopxCOkg4wu0MpFANSh5loOYcOvtVFDZIyv6+ontq
         P6AZS32/yQVv2C4e35hdRGbKxVUH84L11Nigw8xq8CJVIMgLMcWzWuczyaeB/aX7gY2y
         RJEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786413747; x=1787018547; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2ie5zT76vulUOKxlmSFoYHsSNdJQnoxvireTA5JYWQ=;
        b=H3mfgHk1kgvpefkMHqf4k0LnFohv7CSurXLeguDo834vFao2sTp7B/NPAqY171A8jY
         A/A4qF6cmhzBRAKjDF2RQlF24cPdkY+pagC6M1DdUrT+FcPFbGsYe9c8HY23mN/FeAFN
         F6UHQtYqmCE1G3NIQ+gM2B7DC8a7N5Jrh3LiFlkzEJhaJ2SpDPR0VUSHhtgPqgwS0Esx
         CVZrc27x8GbqV36D5n0QtowHYaaH7JhDUCv72cmmo7lub+hlaAee6K4cLVwGdD+e5KqK
         r+DM2/sg9BrE3aSoM+gdHsnwbeSAWV11y+OFtkdobdOP82R9QM+njUuY+qvZxE0oc2D9
         Pdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786413747; x=1787018547;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J2ie5zT76vulUOKxlmSFoYHsSNdJQnoxvireTA5JYWQ=;
        b=Zc389DqP819k2B/O05ggAu9OXHvzWJIPP+T2T1CNF9GJ8yJub5O1nNaTI7cJGX2wWI
         y0gT6eN0grYzBC746lg7Zmxs5/MK3utwlnE9zC38HLrbIEhddVGUs0WqglljzGLt+jDB
         Ov+Gop2dyhdgEU95zt+D8b0HqsgpvRp4RK20chFzD+Zlye5CiHI8SPTq7sYtIszs6sG1
         9+cS3Vf9qmfFuFTBM3A4hySLgxHRsK3TrKYkcIeC53ZJdoRLDdc45/DGSWERiaAFLwZQ
         qN+glELg9tnH+UOcqGm6JCSXOO+LftOEz4Tar1AC7EhSaivMz3UFAiX1uBZ0j+kxLRqa
         85sw==
X-Forwarded-Encrypted: i=1; AHgh+RpI/wwVIyqlk5XuT5h4zq8m5lgJoyNCA54GPi8kafeB6pzIVnlK9KyO95dv9/+9w0TMPeFv9Zz+wfYu9AwHyxy31A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4iaENXincPmosyHU2wNzLlFFe3TKGsw3rl39uKKwCLC6pi5y
	fmq8bNEfoPZzUkJBfmVA1MtnfZna/XAq2XY+M3UOAKbMRNiurCrJMqr9o3Qox+MurPQD9V4ECnD
	loo5t78zadn684Si7FlvrpqmM0u+OWUM=
X-Gm-Gg: AR+sD10iC1uF7QhIJq6l2UG00AaAqPmQaTWV+5xFdyy8bOVyHPJ2qScBDGsDhNIcq6g
	VzP7EdAD4OVuylRwdmU2U8sSFIU1FAdXo9/huuUJ5BsIFZ3StlKqaT7kr4S2Q6RLKdYpDeI2Cqf
	zKNPMDckI+iH7vUf+EZA7KFFaU49xD8Pawz20EnaoYUP7r9Md+VAZddMgoZw8f47bfhhLreSb7P
	9aDkOVVVVMAHXDabjTWVM3e3amacxlXU8PGq/ejrY3YBVVT0vADlX/BrxgkEUsZBm98/A33nheg
	6BUq4WPpA+maJhSaEvXRlTXURgbkp8vek1a6/XWwbxmwb2xH5E5cGbcQwI4nbRhRa2+lSN1QKH1
	0ScWxrvhmMAzL0MowZ3FuC5oip7pgMtly1vB2Bc0pOH5qzlCg2lIm5/iN
X-Received: by 2002:a17:903:3201:b0:2ca:481:de45 with SMTP id
 d9443c01a7336-2d3177d887fmr819395ad.6.1786413746763; Mon, 10 Aug 2026
 19:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810111841.77898-1-phucduc.bui@gmail.com> <20260810121914.GA2757863@ragnatech.se>
In-Reply-To: <20260810121914.GA2757863@ragnatech.se>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 11 Aug 2026 09:02:15 +0700
X-Gm-Features: AUfX_mx0gm4Mq6CMcIZ_Ee9wYl18KOH9W6eWXEblgpbB3dv-eRX3URinfX2ag78
Message-ID: <CAABR9nFkFyhzQO7UGsaiSDcZ8km9=nv-2+4xWo40EG6c555Lbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from
 optional IRQ lookup
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Niklas,

Thank you for your feedback.

> > -     if (rcar_gen3_thermal_request_irqs(priv, pdev))
> > +     ret = rcar_gen3_thermal_request_irqs(priv, pdev);
> > +     if (ret == -ENXIO)
> >               priv->ops.set_trips = NULL;
> > +     else if (ret)
> > +             return ret;
>
> I'm not sure I like this.
>
> The old behavior is that for any reason we can't get the optional IRQ
> the driver still works, but without hardware trip points.
>

Regarding the old behavior, it was handled like this:
------------------------------
irq = platform_get_irq_optional(pdev, i);
        if (irq < 0)
                return irq;
------------------------------
As I understand it, this is essentially the behavior of
platform_get_irq() itself:

https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/base/platform.c#L301

This could be understood as rcar-gen3 not actually supporting an optional IRQ.
If you still want to keep the old behavior, then I think we should switch to
platform_get_irq() instead of platform_get_irq_optional(), since using
the latter
could give a misleading impression that rcar-gen3 supports an optional IRQ.

Incidentally, I also don't quite understand why rcar-gen2 supports an
optional IRQ
while rcar-gen3 does not. Is there a hardware limitation on rcar-gen3
that requires
the IRQ to be present, or is this just a difference in the driver
implementation?

https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/thermal/renesas/rcar_thermal.c#L422

> While the new behavior is that if *something* other then the IRQ not
> being available we fail probe. What is the gain here? What benefit is
> there from the driver not providing thermal readouts if say for example
> getting the optional IRQ would return -EINVAL ?
>

Regarding the benefit of the new behavior:

If rcar-gen3 actually supports an optional IRQ, I think the benefit is
that it reflects
the actual state of the system. It allows the developer to know that
something went
wrong and investigate or fix the underlying issue. In the case of
`-EPROBE_DEFER`,
the benefit is even clearer, as it allows the kernel to defer the
probe and retry it later
when the dependency becomes available.

If we silently ignore the error as we do currently, the driver may
still be able to provide
thermal information as you mentioned. However, can we still guarantee
the correctness
and safety of the system?

Best regards,
Phuc
