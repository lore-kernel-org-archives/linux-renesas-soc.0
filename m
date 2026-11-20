Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175248;
	b=lZdHqKLnAnPm+3YfXsOB6fYNXZzG8fNS6Fke7DN7Jm43ze3ASx92xb0GZ0zqM1vQliub
	 oWngBWIhfyMFLZEcOO0CAlq753Ep3SLAwQcTq0Vql6QFLl/9873Zkj0BzVxcN7KbDI2ZY
	 swsqN9xnmfycN16wNYdS9s+0783QtTv4RO0RM335jCD6P5L33X3RzaYqxxShiClQj3hmJ
	 UNA7wCnpMqm+hELY/Dw4Q8iFxxRcjgacfZj7o6a9yXfP4WJr1oTyr614qjL9pwzrkY+og
	 4LtZbzjUsOxAFaT7CXId8xm8u4VRV6TOkot3tEoP7XtO3k40e+0tTUlhzsuyX0G8ohA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iyyk82KwD0gTHK6EesukEP1DVEZLAy4u41nZQjINL94=;
	b=ROPYOEwZGkVVsJ9wijevFWovTm9vipwXotG74e4Vcaf/5ewMwKpR3S405ciRISrdgCcc
	 QPxcCrtHUuKYr0GZYvf9fBmu2k2ruP2869NNhLtj2q+yIpN2G0O+bEholMLR/b6O9CI2b
	 7vmHq4DK250i7aqgJ4ujoufLt5JVLstvBFr/femnfEDyB+V1VcetoyRHnBMpqDx8QtwF9
	 L0wwdjRrmVxr44np+A0//2H39BESrUNJTBLQc6TbXyHSql7r9ao0laidjdMvyjIgME4fJ
	 ck/DaAzutnqfO9xjN5iCt5e7gEWf/DqwL+mXj5kzYfzaqa1x99y230dZRBlYSjxEQxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75875606A332
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 11:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75875606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=iyyk
	82KwD0gTHK6EesukEP1DVEZLAy4u41nZQjINL94=; b=GiD6KoS3cmPa1hLcSgGg
	v3rXdC4hqxx4lcmtFohEFZ82WB0mJn1C8BPAIK83TXXTwjD/0kSoTGS7dCIRncTA
	vl9D37TI1R7DXDSQ4HG4BgkGpWCj1a9t8ivFrAB9IBfQv8oWp7XjQnlG1YcfZIsm
	cT++Szewq/WJE/NwnfC69Qo3kuguYzAnIiZxw70arMz8AT2kjxj0qzIZtMK4YvqU
	ro4PiOlX3hYF40O2A3NTM1z9W4E9ERqHZe3eMjUtjTpRvWNwInUbXwF4yMYGZ9H+
	H7nWZQUWHwQwmoNMVKy6q4d0kOe12oXHaTvavqu9+c8S6XrzHgcSWYrI+wI4HOvQ
	3g==
Received: (qmail 1461023 invoked from network); 20 Nov 2026 12:47:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 12:47:19 +0100
X-UD-Smtp-Session: l3s3148p1@CWpszrNgLOwujnuU
Date: Fri, 20 Nov 2026 12:47:18 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
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
Message-ID: <awAzRgXaPNHcUC2G@ninjato>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
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
In-Reply-To: <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>


>  struct r9a06g032_priv {
>  	struct clk_onecell_data data;
>  	spinlock_t lock; /* protects concurrent access to gates */

Build error :( No addition of 'rcdev' to priv data!

