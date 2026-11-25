Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617965;
	b=NYiGjYGkNy4b9rP/6FPbhB3zqK+C+zvI1iFqB/ATd7I6vyKg5LRm3h5rB+uZ8USmxETS
	 1m2whC7gFBRIrxLwbWgrtG+2IsgZ84eeUcLs1z84IEK2whDIKsP7u8i86Ee+M7TG3J0MK
	 UYL+2Mnnx0ME+DspdNRPiGGs6busxnPesbKaL7PHN3fi0KRWcI98ERMEz+K0AZuFvTKhE
	 UUJJ47SP4WT9wGi2GC0F1HLwOCtEKC3W/Tia3K2pLH4e9nvhMwb5eNe+p0oep6ILdcNTx
	 CPNL0zdNlIq2PbA5ihhMeJMyPg8f2Kooyp+K8xkWHbRVWbB/HJ6nZXkWeuKA38vDGHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617965;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qhCwXvAyXM1RHsJVCIWLLXEAUGswl0Dh6+s1SkrTVk0=;
	b=EWqemeUUkBpcypITW2aJ4QSh3wRBg31O83ey9PYcxOyccEPDdDs7JOvrEDlsj0NX9huT
	 27Doiead4W7VGnzLpVxMBV8eJLZTGEhzIWoN+ufOygDxMQqT5cG4moXMKbX3+QDZTmaZn
	 WE3vgs4c/vLgnwT8cWmNnga7U+pErPObSS3WLyZhIx+VyIDQYzh2NlmLSJjTbzFKJ556M
	 bQy8jUgMzZGxnBt1mCqisBnwsiJLsPwbk21Vev5WYzvIoOYeAylIJ0KtO0JsUVkymM6Dy
	 MG9i2D64o7IfHXQWzp5HhJitnyI6dnTHg0Xx9mF2/UiumYsbKNbVjV3co4LKydoL/KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE4C606A31E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE4C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9213fddb596so4354486d6.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617964; x=1796222764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhCwXvAyXM1RHsJVCIWLLXEAUGswl0Dh6+s1SkrTVk0=;
        b=NenVWx2evobb6rwKAkbmfkwIKa/SwgEb492099Neh5y6E3qgmMaVsWt/lM1E7INRSN
         zgOf3KqvwVHTqoULeAVzdh5joorsh9uHAoqThnYVz06H4987VaOW3Rk/E/szpfoRl7ZI
         ejaegHg3a9tDGo9iNk3+Itnv4/hfzoD6bF9x+soSsCD/rDMPXLN+nmwv1xca8Tk59Pe7
         en5DJvIC0bhgOWNME/w8awQ1nwexPgRjwCNfvVxfzhTA08uKIcGidj0CvODInfIBkUS9
         9dlU0FDF1EJ33tL2jyFkr1lej9Td/dk6oFRG+r6+E/uFAXSezbwNBe1suJfRsgXi4j/5
         qd/Q==
X-Forwarded-Encrypted: i=1; AL+hErH4v5pywDNCXXLpX/hW+5HJwrQAUAWoUNHB0JJIxipJwzlr/yBJ3AerMjoYpix82I3Jxx/yf7CfdfjWywCdIzRCMg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BIrUVpB6sl0IehoZQjvR4RgXYjZJeXHjaZAAhO0adXNe/LoHm
	iX1rNWOODH8A4QXqOA4nN5D+UaC7CoWr/bq9FmcnK7xJ0OZbKrW4MdMlqCSleuuV
X-Gm-Gg: AZFdTZcXGPofbBaAO8vCn97P6eOEao8P69GLLIYX8/vNnx44FfA3XkP4GvtIMe3Wv2E
	ZZbLo7feYFIMz0w33Illq7d9y6NQca9I8zhTfybQAoOwcjHZW29x0WVd25504L48STekSSOqxlE
	RXmYPyA2dMoolz1v8iQfhArbR8PvbljtSsoWlbYIdThN5PltK5iXXyT78r5C9ZouqmiUnOPxQYT
	uiC+HkxNA2VQ0sFsGgTzzshUCitrdz5dnJ43lbYsILeuyFGvR78mmxGXCna0zHivyOUreB0ZH9w
	bQQ35jX6a6ZuGFLfaakH0qeJfTS/UdmJDQ3dFcLLQT1v6H/dHTjF5P7USc3YHElSfBBiyCYCnPz
	pCygjzm3qLPJFQg3OzXCdTadWnL0JBZk/bt/uA0oBygKQO4aWVAv/SEgH8VjThdRymcyUDAwjMB
	80ob1X9RRalrGjeyzC/1B+j7stc8rlHYz4weC7MCfajU1AlUHO4JEOfi5XF+CuENdAquPAe2dGC
	SVrAoxKMzuyDxO/s3V7SIAaV4QIlLMiGKbZyZ+LVqnGDtUZyf0uz/no8y+iS9wk0wcvgMD2oE3D
	qQCOyk+KddL+N7YEW1s704R6odLoc8KeThLRqRw7tOiQWtM4D9C4DxeidcPMNRPcKGs=
X-Received: by 2002:a05:6214:62c8:b0:921:337c:a5dc with SMTP id 6a1803df08f44-92134b22209mr300386126d6.44.1795617963736;
        Wed, 25 Nov 2026 06:46:03 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm164745816d6.17.2026.11.25.06.46.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:46:03 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-99071945aa7so3237304241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:46:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFoy3oD2kaMqVp+7RGjZGP4SAEDAnMA2ZJ81JWt7/w2Zxl9/GPNkTsFjT5Y6tTmSBT6uCQ/10wrJD+QAETLMIeT9A==@vger.kernel.org
X-Received: by 2002:a05:6122:2192:b0:5ec:7589:f9e0 with SMTP id
 71dfb90a1353d-5ee8af4a3d9mr11210352e0c.11.1795617963345; Wed, 25 Nov 2026
 06:46:03 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
In-Reply-To: <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:45:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2BEAK27P0Da7Nei=DLaHgTdi=FiC5ZMhVegNuGwM5_Q@mail.gmail.com>
X-Gm-Features: Aa3M54o5mrxb1PGlHbFHaQn6zx-fZm6HZYf4SleH1VTd0nBeXxZvXoTTF6NrZag
Message-ID: <CAMuHMdX2BEAK27P0Da7Nei=DLaHgTdi=FiC5ZMhVegNuGwM5_Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Thu, 19 Nov 2026 at 15:47, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform mapping to abstractions offere=
d
> >     by SCMI in Linux.
>
> A question on the approach
> An SCMI variant DT could mark the CPG and MDLC status =3D "reserved" and =
point the consumers at arm,scmi, while the U-Boot IPL keeps the hardware DT=
.

In theory, yes.

Status =3D "reserved" would work fine for a leaf device (e.g. a network
interface), without further dependencies.

For core components like the CPG and MDLC its different, as every single
module on the SoCs makes use of them.

> Since v4, the series assumes the SCMI ids are stable:
>
> >   - Remove dependencies by making assumptions and dropping disputed
> >     items, to move this series forward:
> >       - Assume all SCMI IDs are stable.
> If they are, why not using them in the DT directly?

Because:
  1. They are not stable!
     We only _assumed_ they are stable, so we could relax dependencies.
     With that assumption, there is no longer a need for the (contented)
     addition of scmi_get_base_info(), which would be needed to
     distinguish among different firmware using e.g. different ID
     spaces.
     FTR, without scmi_get_base_info() we're at the same playing field
     level as some other SoCs vendors that don't bump their version
     numbers at all when making incompatible changes ;-)

  2. That can't work for now, due to limitations/deficiencies of the
     current SCMI firmware specification and/or firmware implementation.

  3. Last but not least, they are not hardware description.

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
