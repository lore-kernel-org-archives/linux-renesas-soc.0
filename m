Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00373A984F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950386; cv=none; b=ITWH6o6dYxgZzIKyKfSGwZLDtG1+qiaM3hxAcC9AzFWJ4n/G23t+xeXoZKgugjHw+5JfVpulO/2z5JD8UXS9yBG/wbQb0VNzM2QLFQZbqugHs//NHYse97fhbH637Wq3ZjM5XYxVvyA0qdKaNrt0tP/jKLB8Ph7NTrjKyhN1Lt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950386; c=relaxed/simple;
	bh=fbgeOiEO9EGT2c+GeyD/KoGXlrNibomcWQO6vEICVc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBxdzc6sSbAevdtYTNPWIwLpgtBHsJOc6MNYlZhDELiNNSD9UewKN6MYDdITZWukkIImvLSggR9Cgghe5AfM6+olyFBXxGrcczX3IrUKQaoDqw2IF7cmXomNmVUx2TSqY6FFiqb1HtWBTR/VojIi/Kn8nkGYJAvfoUNrL3GOuZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c5ac25089bso505051e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 00:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786950383; x=1787555183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzZAObXBTvlF5qEmNlbVBhJCzf1NZELy+LTZ2/1S03Y=;
        b=bG37HemPCY4Pz3blqAClDzE4avIi9dwuq0QqgsL2eNY207dbmzlBX9tNzVEvGWtrNl
         dxqZNbBVJqnTWVRhzHfXBnbT/m7afbwnSsl6AS4jZAPFDYO0YtY/2g+aeJZNEm+Ne+q9
         /Z51NWTn29+phAN6DViPTpD/q1tC0BFStPMoHvz/EBGbs3+fA/oh4H575mVZvngdIp8E
         JDhWhmY4jdjlPmRM0ZJB8XVXR/uqzHIMC0+XNEj9+kXyz9/Xg6S1a6Vm57Tx6BQg3V4x
         H/t6YRup0SRyBi6HYbzm4+XYZaDNz8CV7d7Km3vuzNXk1m8X0ReYfg4T9Q6DL8VE3eA0
         zMXA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6j3nKuw7pZgsPCHQQO8KXUurNkvCktYWk7MhCerUC6E55xvRNXmgCql67t4+eI3bkuAifFPcEc0O/0Smzckv7OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9SV0MNufmjrhcl9KQClY5UxNlYwJ6N+dGDrPrP8o/TO4rEuqt
	9dARE6lwkgktzdtW0FHswipUbtCDWF7EBJz0pD6BznnHNAWkTKk9WADXfw9JFwA6
X-Gm-Gg: AR+sD12JaalGFEQmauTFzxJpKcHg56R1fE82dHkUU3szyUhKFDIb/PJjF9cMAPY9/Ja
	GE4Rj9KI1457yqYzYPu/MySwWmlJifG4SCxLGHPHpju5GwVhEOpbpP9kcob2kQIIuDf/ImVm/fR
	7dMgj/mzMO2WRRkFPVHFx/C8neUg8TTsvZPnk2DnyjVtTgIUMNJO7INnBO55EaX7cA2nte6yV6c
	ptZjdN12wFgJYtDPUsy5EeDANJKuLaM1CXW/+yRJGF62kxpd7OZ6DvjGpSffvW33SlSxjuWYHgF
	AvDtfYDVgwWUwKiajYBhqAJO2zd5h3CWGTn0pDrqfYK8ZuC3u2c4FS90tEyzO1zHBUwUL03/cJ9
	bPFjG3kAeHIaEEb2WB3i6gL94cKXz9B4kSFAS91H1Myn3LmR71HHkIMHu2Kf+zaKTMY/4dzCZwc
	/TMnKGqqdwwRI7H8+fVShdlXI7Y7fFexGng5oh6/7sHKS1F1+3AAp2E5sP238GS15H8rgJtn1R+
	Xjfe0csxMeN0r3r9osBfV9W996C0Q==
X-Received: by 2002:a05:6122:20a0:b0:5bf:ab99:ea89 with SMTP id 71dfb90a1353d-5c591f13ef5mr3510906e0c.12.1786950383552;
        Mon, 17 Aug 2026 00:06:23 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5c7909a49sm377976e0c.17.2026.08.17.00.06.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:06:23 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c5ac25089bso505040e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 00:06:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq4FHE+iEDytI9J5Q/Img+745gxF60KdUv+bUb3WTD3BqFW6VoQrwA0C0KFYynFCZ1MFqBbrCJATqUqK7dUB/N+8w==@vger.kernel.org
X-Received: by 2002:a05:6122:3d4c:b0:5c0:fb8d:9993 with SMTP id
 71dfb90a1353d-5c591984b16mr3773578e0c.0.1786950382154; Mon, 17 Aug 2026
 00:06:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811051016.1655887-1-marek.vasut+renesas@mailbox.org> <20260817-uakari-of-mysterious-nirvana-a1d0da@quoll>
In-Reply-To: <20260817-uakari-of-mysterious-nirvana-a1d0da@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Aug 2026 09:06:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU0Z_VP7H3=KX1g7wowG1ZDi__nDgWRmquYxhLHKvd7A@mail.gmail.com>
X-Gm-Features: AcwNN1VnMyJzYsnp7zPKVxOcOJLiN424gLCFqLRF4e6JW2UrjUiX7AMCPRyQHkI
Message-ID: <CAMuHMdXU0Z_VP7H3=KX1g7wowG1ZDi__nDgWRmquYxhLHKvd7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-usb@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 09:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Aug 11, 2026 at 07:09:33AM +0200, Marek Vasut wrote:
> > The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
> > controller with glue logic wrapper around them. Document the glue
> > logic and DWC3 controller.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml

> > +  dr_mode:
>
> We don't accept properties with underscores, unless this is coming from
> existing schema but I do not see snps,dwc referenced in the binding.
>
> > +    enum: [ host, otg, peripheral ]

Probably this should just reference usb/usb-drd.yaml instead of
defining it itselves.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
