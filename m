Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267069;
	b=g+H0uWLGPWaiwF0gybAHaZM29TeGIALCVokB2qvPJSjmJTPL4v9iiMqqW0sXQUzaYpby
	 AtsutSLIlJV/JbCQBEBK98NvM6AllTurz7ML46jsM4zLbYXzsiYguDdxWErry7sBxYKlk
	 yb9WMo6bx4siiJykq4nWZF1sEgeKucBb/tOj6YUTCWJ7ytSC5qJ9HgcJXxhS88dE3EJe1
	 NxBTQs+s5v3EuRrGJCzXonn89Q7881NJjZQnjUvBF2jhgioNr2WK+5GDTRbKHL/SQjEYH
	 vdDhj1lUw1hJt3taCgtTU6tB1cM1Xzokam7uhHuHPfq9IjiixFEtYNdsFNi/9R+ozZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
	b=qtwMDKPyOcx+L0YCdIwX4FP2Xea45fbLK3ibkjEjwN+JnybN5yOEVQKfwi1HArinotH9
	 0wbDoNe7J48AhF661gDfwROge53KgzMNma1PipAIs/4yT92Vp5rzPpJQrHiCgiIbCWcwm
	 60/eguegiBYa4u9vbWpG1BDMIrwEZHlejWICcI/q/j9KKv+Zwe42paKA39dAxcyemAZ65
	 5+swtT8lHCknU9h8UdyX2fFBjAQQ52Oh6/oQr52ccBDnV/SfpPVVh7ET5nURv/jZkRmBT
	 sZwbJx1JaOCvoTvm1Nb2SKCWqt7+R615I/RAUMkZsXCqN6qfYYK39fYXqVEfqjamURg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z5292Tds;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4BD606A32C
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Nov 2026 13:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB4BD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z5292Tds
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5363c8de563so20520531cf.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Nov 2026 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795267068; x=1795871868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
        b=Z5292TdssQirJ7anrgy/Ycj0wO1diReVT+xjqWqnvVpWW2hxPlSx6CnnlxSpqetc1z
         +fddjESnGkA74Im6cQr17DvOW+VGIqruhO1KE5CwbJvPS54ALuMYtx4ha2VuyybUPXaT
         reAh9DT5rV9fy+W//lI4WB/2FhxslsHRt8LxjfYv7VRLIEVwboWlnhQtGGPVYMmD6ihL
         rqPFQZBMUV+gKP3QNnxGnSycOaF5ZFKfpghOCMHkZuVfrGH7y+3NT0bJUqPxS/JDH9QM
         4l+csvlxSOav/F6ZIn19ywP7A8Me7D4xiu4/Fmr/Wb6uhFimbUOp/Inli4T67eYP/2Tt
         /qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267068; x=1795871868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
        b=lkDN+vEqbo/IScqV+9/QJtwob9XH7DehJXkwtokZWTSK2Vgwasw6AMuXuehbVqUXJv
         9MaWnnuT4VhPcqnaq2qx0NRjGDMg8r/yWh1/1+gYHnuYdctLSmdplgDnVHhQJCLwOkDI
         mGHeUUeBD9C7/EK7TVG9vCWSjIEfD12MDHRKUS0f8liwPf4h7GnBlCXXK5jsTgXTPypa
         2Uuh7oT0M7ogvhEZ57ORvW1LVb74PE+a+CD3hPAYhupTH39dz2Caj+0Isd/P3BXEJhxx
         +3Chcd4I023BQnAPFS9ABD06gh/k2t1zC3oCK/rn7tHHNVEiAe5rCSWFyTB90WdostgK
         fsqg==
X-Forwarded-Encrypted: i=1; AL+hErFhbOJqfBm6RS1dMiVR0NpTm2d/nOR0W1/pNMC4BeM+w2ucU4uSly4DnreLasDXGSow99aj5aiqpBnHYdeNE3vlhw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z2bdby/xFipWg3da2qHhvlErsCbYsyQqQ5/FcvRi856pAB8j6
	kldhVo1nnBvKwska4Ud3nhH9TGCQssLS5hBOFroyKHzaN/qmG83FIK8NC8G0KgGucYk=
X-Gm-Gg: AZFdTZdXn+DzhTPcjmasvtEfUWx8TMaRtu6+xt312OQgVm7TL1XZ3gGfHzp1+aXtELF
	UqEqjq00EArWRsdlV5XbIEJuqmGzG2ZFuRnqaEaNSrrrYgQOSZZ7DSs90RKX+CuZd+mQLdMtDW3
	KK4ifjbNEyrOeVNF2Rw4n562cLkkBhWgxYm9Y++1v8yxMl8LKIxrmJpvO2IYrNyiFCROSKz8tby
	h6X5yqnckAj960dbBXARTsXITzEABnFTdvcdCa9VmxRd2e8y8EBMrmkY4A4a0C0wBWEVTqb5FHJ
	MD89M9HD8KxbtI6e+eMm68LoIGLwm7HLb/yCKesDlRIPcFtv4AGd5jEA5uHAokLGyIgTiOu/lFF
	zKnRRdSPnRe559AVskHTpbAxTtVARjfKaEXoJMM8cAGp4WIw6USiKD2iKHDkVia8CcqwhL0bQz9
	hnDG0JLgTPltE3LKPHqzq1lwn16g4T/nsVdpa9ov2699XECEY1xKaju1TlrhDdIcLZxUbQowl6L
	kT5+IrNn1gyVkUDUPPf70OEpkjWc3UVT7OZBTrIVlgFxiOgGHlSICP0brXEhyYJdSC7H5lQsAYp
	V9cWGXVuw+Zk9eqJyeua339jjrcbu/+Cq/RlskUQqyKiag3mUeo820vT8zVpy9/UBP3p/8S4wti
	oo6xh6ptwW6owi8yMUKB2uhWyXuN75udbvJN7IQgoPz04m+lUm5lbtWbItq1tgRWlNOy0jA==
X-Received: by 2002:ac8:5f85:0:b0:55d:2dd1:48ba with SMTP id d75a77b69052e-55d76aa2f7cmr111131171cf.60.1795267067663;
        Sat, 21 Nov 2026 05:17:47 -0800 (PST)
Received: from localhost ([204.244.107.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm53873266d6.12.2026.11.21.05.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:17:47 -0800 (PST)
Date: Sat, 21 Nov 2026 08:17:46 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awGZ-nCCbCNEuyr7@maple.netwinder.org>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
 <awATU_lyjPBxThwq@shikoro>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <awATU_lyjPBxThwq@shikoro>

On Fri, Nov 20, 2026 at 10:30:59AM +0100, Wolfram Sang wrote:
>> +static int r9a06g032_reset(struct reset_controller_dev *rcdev,
>> +			  unsigned long id)
>> +{
>> +	r9a06g032_reset_set(rcdev, "reset", true, id);
>> +	udelay(5);
>
>For future reference, please add a comment pointing to chapter in the
>docs where it is saying 5us is needed.

The reset duration could vary for each reset ID, since they refer to 
different hardware. There's probably no "optimum" value here.

Ralph
