Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545AE3F4822
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785149813; cv=pass; b=CnFWOGNGt9VoxdqMhAXR6mjbYEG3GU8FlRP37VCAKObCPs0qu0nnQrKzUnFaImZH9zEym5NwS0ZlYdpo30X1joIcr+hZMl32IiTePlw8M/tSxpUJxHY3dcNY2BWYNDAmKAAtJbvmPNNGi/Dh6xPfdvjWj3ISVI/6eTjsQKlT0Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785149813; c=relaxed/simple;
	bh=Zb69OLu5ACzcZkGGJOST+3PwfbqmpSOyBQbGD2dPAjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NU+bQSmOXTMU0R3iYQntYMVZaC8NRbsdi+f+Rk4a1Knyk3ZkttpDuSpyGUDI0E2L72OMkxThEbAVpG73hkTH/OIYp9e06WAUe3oYToKoh+pcecjCFd8/pc0HXUpcHczeTQdP20eq2Liaecs2Rd0+47DiPtUuAcRx7hxobpBDw/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWw9tMzh; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWw9tMzh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472326ca506so1685996f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 03:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785149810; cv=none;
        d=google.com; s=arc-20260327;
        b=kzz4/kgfeJsiaG7DPGAVOeFuUVWhio95zWgZtrEQ8tZZvH8BZTW0hKnT/NSKWUauPy
         OgBEhdDc+zSpi6kY76llojUjveMEpeIKzSlZk2FuDcApKLEY5ltmHvPvr7pj+5cEX/9L
         /H+EuqCPARDS051zJlrUqkmfRQtUtwBed5bqMnc3QAqFl3MZELluvcggdSk7rLSPHE1X
         G44b+CXhGCdfpY7PS+XChyer+Yp57Zkv1QGjVhJJJCavbgK4fnqK2sL8Y2GYnWg5dXsH
         LJJAt1T0Nj2FgRIqWhbGhGRFborDLYj8GoZ5knOUeTY5VqZC68x/5l0EglaioSkGyOkY
         iZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zb69OLu5ACzcZkGGJOST+3PwfbqmpSOyBQbGD2dPAjA=;
        fh=jkfI/oxqTLvtyka2JJhTUw9JHJDaNhbiWBlU+rETX7k=;
        b=oq4TXRyQ4IznlD7Q+HHwBqLcx4r3ggoq9Eid00MYeiRGKxMQ3W0lfZJolxoE6te4oc
         5zAFigdhZLXenagEzraLJyZd8dHjf9A0nTE2morA2LvN/aX5DIflgWPYCs/SWa2Wvzpz
         VhyNYHosvQ0EkIEd4w+2zMsOzFR6DnuMNzY1TP8x6Hx9QB2UuPLDKabMlTjFvB89Zhhw
         5s2pDCvCqV9U6u4/1tNy0XTbLyjm8RfDE0h8m6VjnWVxax6ZYIn0nH8qmdjISfCOw5Yp
         ak7P2K/a1LpZ4nSMIRoiQRBbbl8DgQ7rlbhCmABj9o79qykGdpSiT+khsuTGbAC6qJOB
         BXkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785149810; x=1785754610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zb69OLu5ACzcZkGGJOST+3PwfbqmpSOyBQbGD2dPAjA=;
        b=oWw9tMzhuUXZ2OBl/YU5rCTjG2DDcpNv9Bz9lvP1q86HDINYRiMROFjSQCp9AwdmA/
         ajkYOMtEZHTCTsVZQdcSmY2vR6pZ/clkvQtum9wSPgN0PMDALSn8IBIbSVxLLkh65VnO
         J+fGYJ+WhwTBXg1N55mR2ngBnFjCdonTN93DtCon8niGBcJo8SAADCaVbzt2KwTA2gKT
         Jx3kvWyu91y0936+XbEohO1366rWNKgoRZirTQjicwrnYPcCuf+UeXdT53w9mY6SVlze
         YYIVLd1AnZ2Q7xgy3TjKLcT0KO+7CnHyG4/qAtJ8QMcqZFjOt4jTzLbedwMl7Gw/XhvV
         O03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785149810; x=1785754610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zb69OLu5ACzcZkGGJOST+3PwfbqmpSOyBQbGD2dPAjA=;
        b=QfsHZR7T/qDxsnOch5a9DxvL100czPdgmJAVzc8//BwFV0hqjb8vUr0Ma+bQZ092Rs
         MpIXQzu8544Shf90TUd0YYcKJZkcwdlM9gujtGSsN9Y4G9JYL+065+OTv2xzI4IPJ+/B
         aXnmDyLNeNVbEdHzmvdfSy0ZgDLeD4ykaFZj7t0IOj+o/uqdV3y+sQlRCF5yR1yEleCH
         RiD6dl/6/tjIIERS7TVC31aKQQ8xF9DeNCRRnaITt4WQY0o9snASQsY+nr2m65fguRH3
         BlkHcQ+t3VB/fSxJdeOcGLPQTWDn+vIVbPWeIaPdU9zesmWyQUY8TSlajeak/wZcoWY/
         ac9w==
X-Forwarded-Encrypted: i=1; AHgh+RoxdkacyZCybEJ8XXmnxX5EFxz008+GYX0xpAUth8ICl1txOCP0u4odU6wPx1TWHBbRIIcN39zIK8XACRwbhhZorg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVq711K6CpC1xyTrKnrJa8k4mp7TakTJzm+SdsgwDs0YmXExh
	hAVqtybs3B4lfFF5a2oqUpg6XfDltUlBde03gqioRdH1rdyM/Ae1whaGSPdiSrCEzhGf39NiyB0
	0YcqmiKHtYmPAz1Hzxw+qr20hl8lIjCA=
X-Gm-Gg: AR+sD10r6qFJy9SYSpRuEHi4Q48bc/hTAkMgwXq/HEFoFBZKalue8AYgVoj8IDGFbkn
	7taJwgdS7QgJkhgUkE15beik4CVp8AIRr6KkcyO+o0t0Uo/k9DUSy6gPIMQ7h7NjUluoUcbpeux
	cAcmvQh6aj300kkn2rjIGnysSsAKCmD97EEqmxaZogdnlodRfMNz8wLrmIF9NDkB4XHJ2/tyTq1
	JLweL8upexkjcO44ylMkm2kubmPFBgWt2/coNt1yei71evr46+qWdSfhQOJFPYN6CM6afS9DfmI
	nC9C9Bfchx8OvFQK4lmd0EAVxAt4J7PandsA+hAzTgIqjB0VScFTLsgXEVVuEK/4nGHELydA+lQ
	s1QSt
X-Received: by 2002:a05:6000:26c4:b0:47d:efd0:c026 with SMTP id
 ffacd0b85a97d-47fae777871mr155440f8f.11.1785149810531; Mon, 27 Jul 2026
 03:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715133922.2129340-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260715133922.2129340-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <cf85d5b6-7d9d-46a6-9ec5-ab0a17c9515f@roeck-us.net>
In-Reply-To: <cf85d5b6-7d9d-46a6-9ec5-ab0a17c9515f@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Jul 2026 11:56:24 +0100
X-Gm-Features: AUfX_mxmlLrUi-qyrqGmG9f_iX2kOW518hAqzrSNzWAm7CtPRIwdS-Nai2Cmmbg
Message-ID: <CA+V-a8tQLLGi8QeWhqsh4H9ixMwSB_Hcq-eBgmwoz9_n8F44jQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: rzv2h: Drop WDTRCR_RSTIRQS macro
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-watchdog@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for the review.

On Mon, Jul 20, 2026 at 3:58=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Wed, Jul 15, 2026 at 02:39:22PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > WDTRCR_RSTIRQS macro is unused so drop it.
>
> Nit: This is a define, not a macro.
>
Ok, I will reword the description.

Cheers,
Prabhakar
