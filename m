Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928694E4304
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672501; cv=none; b=KpaenwO5S7lmV9P7TtOr49bdmkaqbV8PMvX6G/4ISUvrgNeN5G/Yum4rFDqeJ52uINUMgyRy402IsIkmIiJLqhIzCnsowlawwVtmJq6svLD0VoEO5Oi+9Pr20OFEKO6mbGDJxXHVqDQ/nDRulb/wBvA3XO9Bi9lnYYqXHhf+gc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672501; c=relaxed/simple;
	bh=yGRUq+NkeA2wCzaT3ddrS1lhHL4f/8v2x/N+ptJUPEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jP6iU/Tk8UtLKP+33itbUoTkD9+x5BcdADhMmHQxX/NsGpRO/mLS1VwuvfiaRyJUvHWWYdp4aPwjaYGtfJzc/VWdnISQadVAtC81oLvX1R6d1sxeeVJnoyvvShgBX4QX6bAqcKZlPr/j38V8R5Wty4lw351FZHq8oUFpCxQBS4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f37.google.com with SMTP id 71dfb90a1353d-5cfd29f1208so718890e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 02:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672498; x=1791277298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M48abSoMOPLnpPLpLH2wH9c2xeQ/JgdDngp0dUmsb3o=;
        b=poJ73MpEuMNIolzocKgQuGrifc5tHlXWILxP7b+gypUnvf3riutoLhw6t/HbExQ/M6
         zdaUQJiZhKx8tKMbsEgtNyr1fLa5GP/Y5qfsiIVU+A53UwhRg4V4ZbYVwAm151gCYcl7
         9wZaTuekCQh6ZR5iDU2nbwegIcUcQDLk9/+7k974ZrD0jEbCZcQQtbDb0P2flI/wAptU
         PVrbZTSv5MXt6ev0h7J+DuqXzjeZXsrmi73CjT2wsltgp2qTO4B775IkblTKUJfDWzT/
         EZTUeDYj5pNWWn6TLqXlQnPUcjZy2oktXT5X6PdFK4RsanSJ1XynKHk4ua1ua54+w8WR
         d7SQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4j1eHW59A8kuTV7tyUZ1Kd8n56O8nlXqWy7wjKt0/FH3YWHOACPhIgj+0SCQyUU1WqFxZrgJHxxPAAtRVSitu5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLxYiYLVyh+CCD78q93zycGG0oVtQw6WubC6MWc1LdZRFI17HiP
	5afq9U9JIiKcb9PhBvAcL4G2mb7VmC83k6M89Yn3wDSjLJ9V17ZFKrOcyXYuxleM2c4=
X-Gm-Gg: AYBFou0u3V70yM4TOitAXyKqTxxzn/i8Ky9jOHBUzxsDCNgafEraz+2UNP1IIN0fAna
	zm22iik5hcWMYv9C/WunZpfoTPn6xiP3pVy4QCQH78F/t49KQywqrZzt62MmxKxMqLu0AREYT93
	sjwULm8g0xEptDOR/A44C2v+Jye/jRs8quymTESOE6HrpGLqIQ6Qjk0dnemDsrij6it9zjUIRn3
	EmSj6cJdxayvd85m8S0d46Or5axewnLDB1po7KKYg5SKqS4LRjkFut7QqXY6jy1tS4xemGrrCTj
	UWFREVidNucDKBpsQAUR9wFQ2lBmvK0A0ul6TAQVEcxEGVUcihv6FKT2+cam3apd02c3KTDgt/w
	TJG1zRyMvLeR0TtnMmFmfRzebxtpOxgPpEZIPhQA9xywJZ8L7GeXGeZBMnek5+zINquZ4pAydy8
	B2GXF/hl5uhMP9lxzAl6h7tsRN1fIIWZf3FAQOauttcjwohCSxf1p1+d6RY/8h+LGKY7Y3nZqZ5
	UXDZYN1srUlChzohgvdleIc71kDBUUME3uv
X-Received: by 2002:a05:6122:e22e:b0:5c9:c60e:f4b7 with SMTP id 71dfb90a1353d-5cb0bd5b4d9mr6341277e0c.21.1790672498123;
        Tue, 29 Sep 2026 02:01:38 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cfe5f4fa4fsm7837378e0c.1.2026.09.29.02.01.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:01:37 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-79028ca9371so1362522137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 02:01:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKls8iUi4q9UgJ0BJtdbcKmhUMM2xFDr3DSj3OVNjncBhnEh2Od7XSX+0L3G30jIA1HLWfyoANrWnvEJGE4qiLrQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7af19740319mr5405907137.0.1790672496458; Tue, 29 Sep 2026
 02:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com> <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
In-Reply-To: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 11:01:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMURt52wR7kM3=7GKv7x-3O77MLwSuUDt7KJEf9e+hqg@mail.gmail.com>
X-Gm-Features: AclHuK98mw98nJ3_l_Mt7cVTGbvizjI_Q30Ugi6pttPN_xWKMIDQnQGX1HfBaig
Message-ID: <CAMuHMdUMURt52wR7kM3=7GKv7x-3O77MLwSuUDt7KJEf9e+hqg@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
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

On Tue, 29 Sept 2026 at 10:12, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> > Add support for a variety of SolidRun RZ/G2 based SoMs and both
> > HummingBoard IIoT and HummingBoard Ripple Evaluation boards.
>
> Thanks, will queue in renesas-devel for v7.4.

Except for:

  - dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-/output-disable
    Already queued in renesas-pinctrl for v7.4

  - dt-bindings: usb: cypress,hx3: make peer-hub property optional

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
