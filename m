Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6AC3BADB1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681056; cv=none; b=e2Xfsr6Qea0JOs2PLPi6scsOY8z4+yPGOzIZBeIKJRIK1O9LfX3T2+fyFe7iRdPqkJzStu8srko1NbJmn6sJ/Opo+AMgDRD/jOTD8lh3IvbNHjQNcq0QImRK7iLHP8o/MzP/SsciSqvp8DeW5xqL5+25vkd4VzQ+murO4F68VZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681056; c=relaxed/simple;
	bh=uR7TIRBR3yg8tAIyxRV/d8RKl0ocy3CufGlcD3SG8n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEylD7q1eItxFgLGx8Z7k+rmPRr0eNQd66gCKjh7qJbj9JggZuSez8YiS3dK0yi4PZDZGJ5fND/UThjND8wXAWTL5qczXD5ganv57RyUx9WyTyp323BDplwEiA+Y3ev608a4ecPEjyvkWoVLYiHrKOR4MMN+wiHSbMwM4GXcUHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6cd01f6c11aso1822945137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 00:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681054; x=1782285854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahs58FQh15JfUVstnf1wGngv+BPi4LTDqfDVl/aFn10=;
        b=rcw1ysbkI2XsMV42AyJsWJPnhkKkNstlYgKh/KffStWEvyr9p7BGR+W818x6D3cukM
         GC1lZXaOIY17WylOeYksBnJfm841HKd/735S/Vmw4ONZLT7U8YEbd5fkfmrW/vokhmYC
         YL1MeeotAS6+dTgCVXF8H2RTCt2+AOAFD/LJxhQQtm2OSXuYMxBGZeJPznqPVIQRxtEG
         TcD9ZlhNkWS5vtI8v3htNuTRlvSBbE0L9XTvJ23YHUJfsE4okUqoDJylAtFYONcHMTM5
         V5m7LW8Ah6126Yzf3UxGRAVY7egVE8gk4PP/2bbENeGeK4WZ1A5E1nF4HtnElR4kFXUO
         aIww==
X-Forwarded-Encrypted: i=1; AFNElJ9YrmJrtpDNe9qg9MvnDGYIrRMVeEC81c7WX1gkbbNlbZE4fEN7pDHnB0EsYXsI015kZoGeLOAqety5ixemo7+ZaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywli7jHt8R2EcsAYcBQGvLMYs1vZo13Dl7rOl6wUx72nwfv1x4U
	6CplJxvvRAIemqXSzDUnEl8TqaHLgP56KJrdpic8MdW/jKHXCpbHOciqC+i+HQyX
X-Gm-Gg: Acq92OF544M3T6ejwmi2yPYuIT3gPUNYMyIsdTgWgbpIX3n4oYjHRLgfX2F7r9wRoFN
	Qjqb7NQS49levMT8dTw4K/k6+ZbRj7CJ4gC42Z+0dxbuvq3sgPD+Gq6gPBU26rsOYubmb/H+0TS
	u6QQTsDC7nh9DboZsjQOXPOIMlZorgl94UQ4kSw4+hs4Zz9JyFZnISLsvEdS7Mtv3hvVsVR289x
	aPpIrIs7dvjU/fJA7WTdz9W2qOcVs4xtvm/2HCZfhQvAMQqmJqGA5R38qA5IB7vaZ+Xb1yNDEfs
	7v3MgoEcKRV/IVvw3CUvHbcIL3Ktv7T6y/RTfQUjTZ3PD/QDTiXJmTtT6NJUWKmhYXdZt2U0mK0
	27O4q0zNyC2db4b0gCxDxEL6YNIPxc/MRsFIogvEA152fxApB6/t2uPFUhyBxJ9s6N7D2S4eC9X
	QDBu9f5hstFCBX7EMfHDTxlsu5AulZW/OIowmq0+mgLjFlvzSmLQ==
X-Received: by 2002:a05:6102:c03:b0:631:4580:6a3f with SMTP id ada2fe7eead31-7245d540c35mr1455698137.7.1781681053434;
        Wed, 17 Jun 2026 00:24:13 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720878866dbsm6608216137.11.2026.06.17.00.24.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:24:13 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-961556c15ceso1582499241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 00:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/z9fMqluRACvi10JtnKECpmASYGx59tUyuHnJGREGcRZUE6WuvjnMqObW4m3lOzftrYHRLbWntZN+24MsLahTNWA==@vger.kernel.org
X-Received: by 2002:a05:6102:548c:b0:6ca:32f1:f06a with SMTP id
 ada2fe7eead31-7246c88cf25mr1325601137.15.1781681052567; Wed, 17 Jun 2026
 00:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:24:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW769Sk4FMJWNyCK5jzc5oVZL_4L5wt0w5uyL93wrYF9Q@mail.gmail.com>
X-Gm-Features: AVVi8Cct3Yj3PdPpYaOL4UBKNGskw3sUCzooWr22FhgciKRmjYjt1bOLgA7r9iE
Message-ID: <CAMuHMdW769Sk4FMJWNyCK5jzc5oVZL_4L5wt0w5uyL93wrYF9Q@mail.gmail.com>
Subject: Re: [PATCH 10/12] rtc: rzn1: Consistently use dev_err_probe()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 17:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Use dev_err_probe() in the IRQ request error path to make error handling
> consistent with the rest of rzn1_rtc_probe().
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
