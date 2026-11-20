Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161416;
	b=cs7M68LmBMp1r3RtVghIpGzYcTYpSvY7bgNUYg1U/38s8QPqhtYNOGZzMTPtcu7zcyqE
	 BA3hVGpLprl5sTIBh7FMzoXtI3tgTqpUzes2Pq9XjoZvu+dW+zqmfx5a0tueOfLpJlKgQ
	 dTAbLGGFtKD4yhH+jP+0NxqdCFUIv3pRltv2awD1ORQUi/giGcNVRaCm4ulpS60OoUVmE
	 JqyN6iNmVOOUQtuvDtCqq9xSa7EnIPswV68EHqy8acJ3byXU/TzhKh55TaRQlapfw6DF9
	 0xDxUgqrW1p96dd1+cFMiExhrM1MSN/aZwphZg7wadvSBK6KpJO4XkbUW/TpSeqlX3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161416;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VaLwNIkn55D7JevqcpHCVmOWA4zFnE98rOcR5xGlqds=;
	b=W5EWj/NslDpo6lJB3SYWWcbNR7L5CRk2bfCmzQgQy2eJS9aAyiHCwzVWtrL49bMW4QjL
	 HosDodKj1CKffV+dw2hmmibPmMumqZzUXD0PJBH0C5o0fu9IVwRQmPttfv64cOUmt77ud
	 NmcOqyG3JRMq869HUtVJ9+zkOoAXE1bnxl+KztZyyVZl+E5xazwfOjE0lFDqW5s3zJLwn
	 BmTg3TlX15t9WMtt7LuxBUoXNk3tgI0wafjmYIBZyO8mWzt6TaivVRk4tZZrBgrGlG9+T
	 4U5DYAreuOKBIXJlkswX/Tcuq93JfZVIHc3bB9VBJEvQw2XcWsECgP9z9YqCxykkwOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F30606A320
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 07:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F30606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so355975241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 23:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161415; x=1795766215;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VaLwNIkn55D7JevqcpHCVmOWA4zFnE98rOcR5xGlqds=;
        b=pTzl2C67cyqrzwPqUfGCZkLTEpgB5IramvLD3G6+WVCIv97aed9cZl1gJVpOns9/XY
         nHjqJUlqW/prQGqFe/lmIU+d58waQk1Xt9VytPPssSvCipE6qVldvmv4I5WmIAYciLk1
         GZ1zBaxZ4p36JqnMZ2SAjZ4BNlVsZv1MaA7RI2Ji/CYVSbEuzeWnUvlp4Pr5GTWKXIiE
         LtDkIczp9wscC+pACKr1AE8g6zJq+ngqH/oduqm85uRcWs3NlY1t08ymSAh+c/w6rY2k
         zanx1rZkGexQM/rZ11KsjGgsYBBs0DCFI8Njqgjd6OMjOBax9p4zVn+BQoKoBEP+04zM
         aGXw==
X-Forwarded-Encrypted: i=1; AL+hErEPgMcZWQWSUQ/uvsH2jCEpoBFOAJ263mexPapwEtUnYxwd7yF5WZQrbK0nC+1jBs9ERe34vuhEHS6R0fP6dKBn0A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q++SFbYmAe9Ju0z/rSkegpN2JsAlVwrBrPcmBeP1sWJMNkG8Y
	CPM11pwao/gTmUcs+Q3a9dPm1P1HpDkX/U9I6HBy/i92UFELBM55LTl4rMGTNOPK
X-Gm-Gg: AZFdTZeuFEqeT/5L6+OGGn4QB0p2ekH8hxxzOJiju4hu4xvQDpA7as9/GuMxkVpO2Zk
	5dULSCDCHTsF3v2OkfekKb6y9sV5tJXpWrmNrZGe9GneZzSQDHG9SGUcqfH9V8r2zMvxVebfZuz
	r6E8WSE0IH/4Ou7ZQ/5Fc7CFgu+isC7S7y7MM5N7vDmouzyh0vRVv2E3RWmisG28965OjCiMKpz
	8+v0axjTHyC5YCoNLO4ZowmSJ2cZB8IfzXt605lpuB/vfOm4N1QhtWoX8VXbmAC8Ar26geP7BsA
	qLsA0mqAOlop98+I7tjlaL7f4cxGzKq9ZYGDiDdfunQhm7OLyNmvF3U7z2ILcPFBC4o2iJOkZwH
	YfqPZY9+eowYQNT3mLY5u3y8kViHL+u7y97zA1IGFoTYtlqmMVzJoDoCqCgd3YNDpbKOJmKCCfs
	pdn2wfJmQU0v6quz25BxdPw+cYtesiN3mSgzR/X2/V4zI8X1gdYVZF389h40XBbbUyARVMUCsA5
	vPqUsKnEU32EJzLcGKafpaZGX+EfkLnosy4/0yOq9NIjK9+2dgkn2NP6GBWG9a5B6VGubmXax23
	aQEU9ymDEJs1Kin9wZ4d6h+v6OtlUvfmWbj6cgUg2gaNunxjApqt8sGis8jaMwH/3sNSvRhvZ5M
	MGaj+jHuKczUI
X-Received: by 2002:a05:6102:448b:b0:7cc:26a8:e726 with SMTP id ada2fe7eead31-7d739567d98mr1003785137.26.1795161415274;
        Thu, 19 Nov 2026 23:56:55 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f3d819sm2300183137.3.2026.11.19.23.56.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:56:55 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2da1667b2so366763137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 23:56:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGPC3jVA0gnkdLoA4WGjPU1HVXScC4t+5+WBMAnOdKmtUn97RgGIBsfTA4E2fYpVfP2/VrCf9mR/Y/k8w6Vp/7bEA==@vger.kernel.org
X-Received: by 2002:a05:6102:448b:b0:7cc:26a8:e726 with SMTP id
 ada2fe7eead31-7d739567d98mr1003780137.26.1795161415051; Thu, 19 Nov 2026
 23:56:55 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <cee843b319c9eceba2339f14a134e305a2b05d7e.1795029012.git.geert+renesas@glider.be>
 <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
In-Reply-To: <57d2cc58-15ac-434e-ab40-7a8a54d93a1f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:56:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
X-Gm-Features: Aa3M54pzvZjiNE5ltwUGvGnHop8D2bVYiqyWJcr5J_J0ppW6-NxZAErFEYs73QQ
Message-ID: <CAMuHMdXXS4ZTxLBrZoNycHUzdUp9QsisfA7CcBPyAGw7zTuSoA@mail.gmail.com>
Subject: Re: [PATCH v5 01/15] clk: renesas: r8a78000: Merge debug prints in r8a78000_clk_get()
To: Marek Vasut <marek.vasut@mailbox.org>
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
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 20 Nov 2026 at 06:28, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > The two debug prints in r8a78000_clk_get() are very similar.
> > Merge them into a single debug print.
> >
> > While at it, unwrap the (wrongly-indented) continuation of the
> > r8a78000_clk_get() function header, as it fits on a single line.
>
> It might be worth mentioning, that this now also uses
> clk_hw_get_name(hw) instead of map->fw_id .

clk_hw_get_name(hw) was printed before; fw_id will still be printed
in get_hws() after PATCH 04/15.

>
> [...]
>
> > -     dev_dbg(dev, "Mapping DT clock %u to fixed clock %u\n", id, map->fw_id);
> > -
> >       hw = priv->fixed_hws[map->fw_id];
> >
> > -     dev_dbg(dev, "clock %u is %s at %lu Hz\n", id, clk_hw_get_name(hw),
> > -             clk_hw_get_rate(hw));
> > +     dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
> > +             clk_hw_get_name(hw), clk_hw_get_rate(hw));
> [...]


Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
