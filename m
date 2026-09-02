Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25FF43CE42
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351126; cv=none; b=oOt5R2lo7q8zTIApCeI//9/FjtDbuEd2YT5JAtOq4B2YCB5igY64R9JUOygxKgwoICs6iRT/7sDPhLrLLJqR7BtaadCafP87B1JxAtDUEEn2BTikJtqNVGLl4bVelVZjVziBhqlH+pIhtva5UDZmkDI7EtVT+ucxT0bfoK33xFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351126; c=relaxed/simple;
	bh=BGVT6NiiPBGrDzAWTCenC1f6pOP4TmMvoz1BBe+v1UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+ObH6lbI3IwOt+hmVvNCkRFqfNz3JT/9usyp8qmvBF5n3aY7WHVUTpGGrigeJgDsuOlTAtifZzlcZK9yK7XFC6Z/FcTHF+KWtXLcCGaaMsNVAElDpmG7zVzBEN8+2DYv9E04Dqq/dY2ljT3No+N1A6ibAKFr63T3kYC7UMxyUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92f0b5ed131so125917385a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 05:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351121; x=1788955921;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zZuEv2ob4j8Zh+WhkA/MTuPTTESwfEtjHWVWham0Lxc=;
        b=rPtvzfpfFbE8YFNjWAbqJZb4SPXHB8rNvWyS/+JlPaLP51zRSqzlsBSNSLLhvBlRKb
         /ckDFdi7tdELPWeka9o5yHsLd0qnyBTEcGmLLJnl6dCaWgKJkyASByQNtNguwn9eVx8U
         blr2DYjcJM/3ijPJ8+/SGmk5lKcE1vjzEHUeGwdLryUH0x60xloCIkkF7dveJfPNHopl
         iw0TpZVo4fhd3k9gnLTM7yhPfHdTkTYaDT8tT9owv3ri589xCHFpog2LoAJB8Mre21lG
         tEJdDRBycYPdetzLq03XGMY5xu+uZU/ufFg6MTAHOEoqddOrSqPVjzB53VW9CjF6kkll
         Hnhw==
X-Forwarded-Encrypted: i=1; AKwUvBzJHXaVvuCGfcv77U0onabT/uctSo+316XG00zQR+YPo01T7jFlAhLAxICt2wUld/jBm/uVVF/l5KszLe+rR8b8ww==@vger.kernel.org
X-Gm-Message-State: AFuF++kBvU8ug8NNSmhZjtQ0TfPAS+J4LT6DggUw6sBVOADiRLAXlIeT
	22GLOelLFrBBBUfdd59ovOBdeeTmw2ZVlTzhEN8LN9jS/a+/DXsVBfg+bmxToVmN
X-Gm-Gg: AR+sD10eZDStpHpdjZ1pcOEv/pPwaQ4y8AXagQ411FvcxH7R4sHYCfpHBwbuPRee3/W
	iUDRNfxknNLgqzK5dXPqVHQ6eMt+/xgN7HtaX/5oDVGdadojatDzaHBSs+bzkOeMALASw6XaQ4+
	jBTCY/ENMKG+tJ/n1NTyJRx+FKwF2es6paBJomUczfkY4F3AlGOFjOtbnDciMiu0qAhQBnzG5Am
	6rNp65R7RVuvLZn8C110ObiAJM37zaP0RI88eMgsIxrDYjzUHcQMpyBIqplBcque+wlUfYC+3Cl
	bsbmiCOt2jBZw5yFR4CCnTaJWKAuAD11PKSRrAimkqVbCpX6mfd7q8d9g0D9GBzAYreBPE2/iDP
	qRwLZu7vd+vx9LgJUaptn+sp7TIL5jtQauPyXItIU0mhRwWuvL263Rmpd1V18FhgRP3+cbNjExH
	4p28jMhXJBs84JDdCiUP4+IBokhDSV0CUnuXuzcKTI7tqRGIQlmxTS+CCDBqD6MmYQlXI6takug
	R1CaFyWZTi850cAB99ycRGGIgb6vd6z6fteGIK8
X-Received: by 2002:a05:620a:711b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93960fe4a2bmr430107985a.41.1788351121345;
        Wed, 02 Sep 2026 05:12:01 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f36123esm189822385a.30.2026.09.02.05.12.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:12:01 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92f0b5ed131so125915985a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 05:12:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoOJZNkRw2hoQgzcKcEV5FJGqY9J9y61UAAiPMltMkrqFXA0jExfP7eB8aqEIOrKThFQBMRLX6NpcPT0ZAHndD61g==@vger.kernel.org
X-Received: by 2002:a05:6102:14a5:b0:784:94dd:5389 with SMTP id
 ada2fe7eead31-78a1f3954bfmr1187932137.13.1788350628203; Wed, 02 Sep 2026
 05:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
In-Reply-To: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 14:03:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZfH5rzN-xFvyfERt=j+c0aF7ZSbAn7XTM=R_u55+3MQ@mail.gmail.com>
X-Gm-Features: AcwNN1W7aL6kq2Ib0xjLGz4RQRE9m6dme2IHxODeY3IaF54CXwsKAcwLlCow_cY
Message-ID: <CAMuHMdVZfH5rzN-xFvyfERt=j+c0aF7ZSbAn7XTM=R_u55+3MQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

On Wed, 2 Sept 2026 at 13:50, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of SolidRun RZ/G2 based SoMs and the
> HummingBoard IIoT Evaluation board.

Thanks for your series!

> Changes in v7:

Oops, subject says v4?
Fortunately b4 is not confused, and does The Right Thing(tm)...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
