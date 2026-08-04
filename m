Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B9F403E9D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854370; cv=pass; b=bI1t3Crs19gGL2McmGgUcJXBIY2sSXDPUdLYfvLtRSpe1bAIPfDew7jctccjIkM8JPEyxGumc0Wok1fVq3Zg69kkJaF2bVVHEw7gyx1HMc4SIKxT+APBM0e1l2rdA775+b2WZOzwCQ8gi8zo5KSAtPOactWJtFi3ncktfPnq1A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854370; c=relaxed/simple;
	bh=bMjTSFpuZjUC9lqavTVveIP8dKLNYf4jxafs2Cnojt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0/ulXzPpTa5mGP2xfzRW8nWyz7VPT4H06zPr73FwvUMzB+ICCzg9azgTglevUevzR3LEkF66x9Ihxi7vI0c87+cX+EG/bBtWuNEBPeiRA3c9Y7qn5twoshUyMdRRaAdGvsd4sg29DdiDX2eN/opA+Y94V7aZ9LvKcRYWV64h4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0j8fMlt; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0j8fMlt"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso3546888a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Aug 2026 07:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785854369; cv=none;
        d=google.com; s=arc-20260327;
        b=rzp4vq9ubxm5sOT9BiHkQv+kIqdumqaf0coCET8++P7zAY+9nuVlRdAcVwNOoNsjN5
         YuJWb4KzFZeCuWJo4L8mDUvXnaioMTc1TqOsYgyqJWF0AYQilAI6B7JoZqGGMHhAbwG4
         OE54M9DKwq7mlFXgi7t7ld3yKSjVdctGlLaHMRq1tSsrCiDliCMpeCFxhmq4ofgDHQe/
         aewxlgxdSy8ffj+NlZNfq6XnNezlKX2cgR7xcYLExD88IDYrPlVbHwvMGCkIUOngMqy7
         ZwwwqkAZ1FVeP6zBcyR09czHttq6hKTmBpbsCQ0u8EMOnSmDx2hxNO9stiTTS/qNUaY4
         7HOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bMjTSFpuZjUC9lqavTVveIP8dKLNYf4jxafs2Cnojt8=;
        fh=eCGyIYjvHIe3gIvie2+HEYizuRFFL/QF+pkhWErniow=;
        b=qR5BnyMNk7H2YTv5eGIP5K6LTCNjcfGtpdnWubllGPF8fCkoFGOQLErph0lDf/jrs7
         zYwN0XF2tPMJ48ohyvx+MIxWI622KNTFhGM1DHB+KfCoOHewTqDuqNLqzATQksutd1sB
         vDa3GUwavprOwSuENWzj+o+wkYTGs9u7NHylFvQGTKScV1wf7A+cpUQD4a/+4lw75Cjz
         BJcQG1FoRq1y8O6x0IkCGB5jYvvfji6QokgRsjXQ9K2fvNYHmywbR+tKpJ7oLMsaqfvJ
         AOtfJDTP+k4vxdUC+bozKSEfsJRX4vAfS2WQOtsrY110WFFzLe9I20Fe9JwOTcmQso3J
         gqJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785854369; x=1786459169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bMjTSFpuZjUC9lqavTVveIP8dKLNYf4jxafs2Cnojt8=;
        b=f0j8fMltVYFQHMH4NVKF0lKPsT49EpC2Aga2hteEzAiM9pMpy2+Ri492wY2flqnO8E
         tOBEgIOc5nXD20GY8HaolbDKFTzjIDnGZGgRxFIHIj1hDmkEFH9+3JzK/qvxqRjX2pO5
         XLxokxvNz7nOuOjUUkQ1Z6guNGVubnZQqsyeFX1ntrUl0KmOou+ic60kwXNemZb+cNM3
         B3QQMwp5hIzto2LqcxQjzv+n1vk93a+a3mkAFfNy7jgKzhW/Dj6g4oJ7JdTG672DNy+l
         sBohgnydpQ4q9xmJoLY5hRVI4FeAjQ7otKP+pjqDPnTmrlbRJ5w7JLQStfMKFOFb2JSt
         oSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785854369; x=1786459169;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMjTSFpuZjUC9lqavTVveIP8dKLNYf4jxafs2Cnojt8=;
        b=nbtD7N+koKQRZ/ttJWktu8ESwWY1I0la8GcSv8dGEL5YopDADPJhMKwJS/YQWVWg8j
         yY1qd/kFNiSn0oSfvagNJV5GNjMbWZdx/Ut+jDjLAtr9dE0gOnNuJis41NhxJnD326h+
         pKZ4tOHM8vdnSaC1YHJcty5ENYJ6F2GhPBLi76lhVZVSEPi5HvINShAb4hcjXXmPwN2K
         2kw/1OuE57TCxjYSAzHAp+6i4RTnZKe7iqm+GKbxskcna1JaWS5h8Gg0esAClRAK38sO
         APd7MMYfVPwrDb2Pj33aXx15ukyJpZphySLDLTwnuR+gTE9TBBOgedHF0B45HXg0pEF4
         4fBw==
X-Forwarded-Encrypted: i=1; AHgh+Rpggt3JZBySkbP++OApP8kuG4Yz0Ww7IPUaDL06UxF7ZNldyidR53+2NclLnZtsqVLCgzpwUgo2y0PWvR3MZBRTsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKyg3hwNQSUcZEWNV1WWonxwgRSbTXBjnrE8V7VXSf6saVg3lQ
	slRdPwJqgnzOTsrBMsZ+fM++BEyeKSVbaIiPiFdJ1xSWR5+O/67zw/sCKvjEI9j9+UHQvMVU7z4
	sOz8hIx+zitX6KMfrMsW/FimKFkS9h6o=
X-Gm-Gg: AR+sD12lBgLDHbxKunGSQgtTKM5qQ6S2RsryNHw1D/4izErQ6OQ/OEji4tmPoHFGhAD
	Hst+ClrJc9pMNtb2COcnLOZ0AeeFjaRWwU0AEuzUCOWPPViNagf2Y1SQA9PL+w/SiSwsbyEiSO5
	i88qrU0lGgDUgU0f+gbJo6rQYMfJrTaQdjELZx77qXQj59c7abSf/BHeRfVgl4/7gw59irF4jJ8
	TBzHF8sdGp25MrJmXBbJaiF7uJMdPNvJ2gMcBXAkbkjvgKs9CpN0i/I65HhQjp9KoFrBGSLKOb9
	5SCbsNsuAGgq+bPAWtPbUlfQfoMQE4bIHp9fQv2wIgLeIJPN6waD/ncos0MflH8n9ag5QRvwH27
	h6nmXsyEC60st0piKm4FhxfLTbgXbwKRZdg==
X-Received: by 2002:a05:6a21:1f87:b0:3c3:875d:7053 with SMTP id
 adf61e73a8af0-3c92a4d7467mr14184745637.8.1785854368571; Tue, 04 Aug 2026
 07:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-rcar-gen2-1-v1-1-4796ea6e76d8@gmail.com> <TY3PR01MB11346B7C0EECC1BFBDCAE069386D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346B7C0EECC1BFBDCAE069386D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 4 Aug 2026 22:39:16 +0800
X-Gm-Features: AUfX_myLeceJ1yO2UsOeWf_1wS8ekOkk6L1ACbyEAwFFU_FXEvt76wsYaYwuMEM
Message-ID: <CAN4SLj1WbUQRNj17zAq2F=gh20z8ao69JG0NH1mH2_QXEB_8Rw@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen2: Return -EINVAL for out-of-range
 channel reg
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Ulrich Hecht <uli+renesas@fpond.eu>, "wsa+renesas" <wsa+renesas@sang-engineering.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:26=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Felix Gu,
>
> Can we use dev_error_probe() here as well??
>
> Cheers,
> Biju
>
Hi Biju,
It may be better to convert to use dev_err_probe in the probe function
with a new patch.
I will send out one later.

Best regards,
Felix
