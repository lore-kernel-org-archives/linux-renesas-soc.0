Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817320;
	b=UCnE/aibVkDkAxB+AYbrWd7MRiEjr0wH+R0eV3kg0jRuXMy9Cj3liUwBhtjmc1jLB0Sy
	 SJYteigos+esAd/bTh8OGJu8hpjK6lNpg9w8hovyTmATYG5NtemoCV1f8W7PylmpCHmcf
	 zMopcDg5mT59O2XzCQaDlxhXf3v7iPDtJErkivmnmIXwWnkQcaV8IXkRaflMQACTY67ty
	 UrxsuAtDh33D8IX49WUXYKkh3R2r4wy+mWkfY3+qYWoAdRwg649OG0f41qEnQyLi8Jd+C
	 DOcpO5vTwW1HpKgPcvToOQCyM5KyYj4snWPz/Im0vwoh+F9CZMWLcd1r6HZJkiT9T7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817320;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hFHwL0dJHfEmg6WJ1ZYqq2RC1KHegZZ+9GEzz7lTf8g=;
	b=Ud6S+pVhD88WQqelyD+sbf/ch3Cth1hUWfaz6TVpMJsnaTITN4BOCYhmxQls8W6uur2f
	 fi55Z0mFpm+VXrMxHRttMVdtw0EnTMBDT5IDTfyNX+l/s+RDQpM8IgA3iH20XHJbegwOR
	 YRxOGo3zg2R+JImn3rQy86R2WldDQ3nDWBL1SYpSn3OYkctyerf5li2kstSvqEH/M0Pg1
	 5WU0LqL4t3HufFsM5TOzVSnfPjec4EvFzK9/0AhELgP8QxG9ZZ3GL9dLQuZ6R5YStnDPf
	 rJXWP+7KSUl1tFijOdFyHTdOvQFHxh3F9/62Wf2Tbb4AFcpFNBI6ZEEaYEZcgpIp7/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=a6f7XXeI;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA85606A32F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 08:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA85606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=a6f7XXeI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hFHw
	L0dJHfEmg6WJ1ZYqq2RC1KHegZZ+9GEzz7lTf8g=; b=a6f7XXeI4EbsDhCBF8mg
	EX6BluFyS6AAEdff0oZDzmNir0+tHKQfuoo9Ud2sFZnXmUqkaDEenLfPyMLoVwQt
	q9jxxpbDOp7Fe6Ie4a+IRFfewMG9IHTvnGVAgG0YFvkYVD02XuYl7bbFjToGH6VZ
	MC1T308y/oIwXKHChAX8Hvpo573ARyScH8pNA9GE+OEH433phKGPavS0PSlR2oCR
	lzl0YfbXf3+oV4J0oPwBp3EhjPWHkkfhATrc9Td5LkXy4YuegozzUle2gKLAaK9g
	aUD5estbCHMNCuTAydnLrBZb6ldUjle5Q+dYJ3771VHcZHXVtbO78xnP+5kAewtD
	kQ==
Received: (qmail 1194292 invoked from network); 16 Nov 2026 09:21:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 09:21:56 +0100
X-UD-Smtp-Session: l3s3148p1@dYeTeGBgHroujnv5
Date: Mon, 16 Nov 2026 09:21:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/8] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
Message-ID: <avq9JH17YzYlO3Hk@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1792163045.git.geert+renesas@glider.be>


>     Describe hardware in DT, and perform mapping to abstractions offered
>     by SCMI in Linux.

I used this series in multiple branches as a base to enable further IP
cores on the X5H SoC. Worked fine, so tags for testing are coming now.

