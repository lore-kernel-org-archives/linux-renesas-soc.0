Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC96417D7A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533636; cv=none; b=cF44WjPVXEOCt29NYBGmOSJGQXixaFFxXO98Bfaw15pcYLUUFAWi40VInAMbBPtlx58zzvbKnAY9XCBSOf9SsItU0K5SK7fS0mEVfp3moqxgtcRHwBAFMcF9IxvAM4GcQwil4gi77f5TxQrFoAnPCc1gneiHDY5AdS6NPAwoKww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533636; c=relaxed/simple;
	bh=ZDQ5pPWDKwycT4E4mNOoJZ2LV+cHXkkjmMM1uiBduVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itFz59bi0DDd3m75E+eh8bEz+t17JsBngctF64bTi1vjkXOkCvezsp8o4q1ws2fMr16cqS5f12+UlCv+CA+Vokacb+rzNcQmLkUr3hbF/Ll9X76wcbFUXmusOBbNLUvNM4laKUWQ6BLn9jPQhe8nYIB7/nd8YbZywHV5cE4HhYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1289244b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 04:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533634; x=1787138434;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCCZvy6wBuqHUxauMraEzIMerW1TTEAMcJhR4qIYKD4=;
        b=ILFgMPaULcE2GJdm/ZP4FJ5CrXBGMfOlm4XRnFzbO5F02r7obuqiHtJhULfEMm5c4J
         f8wm3nvgdDB0BS+BIxVDLGb2L40I1YAA0169l5wZ23IDsjRCyeVNWTIdew7AyQFUreXO
         4lrgcxnYeHwOrpOHbRfnrYCpFDxXTkrWD8mFeRpnpxP9vilNCOKTrXizV1H2NCO2+yjG
         oESekhzD28zDIOnTMWgwJOGxqNKpiXGA25+CnsfbHZVGI0KtTXc8v8cfC60eLwQpgk3B
         +c9i01iRrYs+H68s6TGIPo+7t9Xq1rQBhP98dY1dvqytsYvRL6+luBBkFeTtAEjWErD5
         +iiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2UfGQQt+X75uJuPneFtdvjvDjWNFjT9pulE8u37FLr+PDGba0t5XFjEd3nbeVZLGQEl1EF/L+bcF7otZJ8SMWAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKW19Csj84I2atzd3D1xhIQyzY8xqA4ZL1LYjRkw734EWlxSwC
	jgRKVaZ+5WmcCv/ZlhBc3dboapHTvRsUGJm9XTkjzbXkxhm0WX0raWZ16VxXsVsW
X-Gm-Gg: AR+sD10kcf06K1jRS4GgcdhnJgaOuVENnIRqSoLYF536I8yWWn6DVDghISqLJcCLByY
	i4JAgYNzfCfPPeYvH/3I2/fFY3rq9vonODPaw3tlFHn1qff5ota/0NRv/s9ue2h+K6O0b0NouY1
	Cnic8x0xo1CQ8b63Tkfwp0vTwvKA+khOcvDZ97a86RXi7Z0wXEO4uQLQsr30R9ak3zlbOqOcfjy
	NU/qvOQU5v4JDs2goyln28Oo2O1Pg2ak7dsKdLQrU9leq0E7g+1mGh3Aj3UK4MOEeIfNeTUeGHL
	+26wkOsHSezbDuGVxaGgWGxUhrKktohWXAsbcx44e+EAcN500iXxcLuVTHWs1nqKlDM0wED3wEQ
	X6BUoDDKAoVR8txU2/KIRIk+bSgkh5h0Oy85mdEQIpaNPwv1eL7gDaN0uRIEvH6phDDemCmB4KB
	Qio9QjFemuzI/R37li44W7f1uDLjURYqjmzCPATTUzsMN8ZgTkH9VmqivzXl+fVmdeyakcN0zAt
	wSK0NRAJ8uVUpiP87Xiy8G27wbYIdoRBWY7w0Zq
X-Received: by 2002:a05:6a00:2990:b0:845:d650:b75f with SMTP id d2e1a72fcca58-84fb53c1737mr5188899b3a.8.1786533633958;
        Wed, 12 Aug 2026 04:20:33 -0700 (PDT)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com. [209.85.210.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1d24ec8sm886760b3a.21.2026.08.12.04.20.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:20:33 -0700 (PDT)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1289218b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 04:20:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqttzXxUbJMufF0vlodf6BN2uVGDDVcwvM0gH6YvH2rKcsQqPha9gyCO7nyH/DMu4/NguCCS5X0GUPkzCYjDm2lYg==@vger.kernel.org
X-Received: by 2002:a05:6102:5692:b0:740:177:f357 with SMTP id
 ada2fe7eead31-76c8d1f94a9mr774665137.6.1786533275732; Wed, 12 Aug 2026
 04:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org> <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
 <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org> <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
 <7b066c1f-20b7-407f-9268-e9dbeafab004@kernel.org>
In-Reply-To: <7b066c1f-20b7-407f-9268-e9dbeafab004@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 13:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXgNcxDJf8XsSjXhC5+Pq6+Z+mcn6Hn50u8KwimKt9RA@mail.gmail.com>
X-Gm-Features: AUfX_myBSrf5rDcsVRuaQc_or0Um_HrH3WBYGhc9bJh3otQ1_zgZw-LE1s1AUdw
Message-ID: <CAMuHMdVXgNcxDJf8XsSjXhC5+Pq6+Z+mcn6Hn50u8KwimKt9RA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 12 Aug 2026 at 12:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 12/08/2026 12:02, Geert Uytterhoeven wrote:
> > On Wed, 12 Aug 2026 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 12/08/2026 11:47, Geert Uytterhoeven wrote:
> >>>>>>>>> +  firmware:
> >>>>>>>>
> >>>>>>>> RPi is doing similar, but I have doubts. It looks way too close to
> >>>>>>>> generic "syscon" which is disallowed.
> >>>>>>>>
> >>>>>>>> I think this should be vendor+purpose specific, e.g.:
> >>>>>>>> "renesas,scmi-transport" or "renesas,scmi-firmware"
> >>>>>>
> >>>>>> If you can tell me the resource that a 'firmware' provider provides then
> >>>>>> it is fine, but you can't.
> >>>>>
> >>>>> It provides a firmware API, which is not available until the firmware
> >>>>> provider is initialized.
> >>>>
> >>>> I don't know what "a firmware API" is. What does it provide? I know what
> >>>
> >>> It can provide lots of things (everything we are no longer allowed to
> >>> touch directly from Linux ;-)
> >>>
> >>>> a clock, GPIO, reset, interrupt, etc. provider is.
> >>>
> >>> A clock is an object you can access through the clock API.
> >>> (s/clock/.../ for the other cases).
> >>> Firmware is a service (virtual object) you can access through a
> >>> firmware API.
> >>>
> >>> In all cases, the consumer of the object or service needs to know
> >>> which object or service to use (there can be multiple).
> >>>
> >>> In all cases you cannot access the object or service until it is
> >>> available (initialized and registered), for which we have -EPROBE_DEFER,
> >>> and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
> >>> firmware".
> >>>
> >>> Thanks for your understanding ;-)
> >>
> >> I think that's the difference here. Clock is not an object, but a signal
> >> on a wire or within IC coming from one device (provider) to another
> >> (consumer). Firmware is not a signal, not a wire, not anything which can
> >> be provided from one to another.
> >
> > Oh yes, it is a service provided by the secure world or a different
> > CPU core to the application core running Linux.
>
> Service is still not a resource. Not mentioning it is way too generic,
> because anything can be a service. We have entire services-based economies.

Do you have a suggestion?
This is just a phandle linking a firmware consumer to a(n optional)
firmware
provider.

What do you suggest?
Perhaps "scmi-parent" (cfr. "interrupt-parent", which also does
not point to the resources consumed, but to the provider of these
resources)?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
