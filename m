Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751280;
	b=qLFSd6OL+OYfIK9dqZSdAF0FjsfFc72/MxXL1c9xxzJBYDpf5+RE5zDUs2bREECBRDmq
	 NLhq3+Dvx7aagdKyB1ogfiM8LlVdQtn9PUmmMMIZwUzxHi7SQBdFpiWuMpQ0HA6ZVV33+
	 kRbM5LaewCwcaqLj/a1hET2h91/guQ/FnQVD/Lj7HOykM/wPiunQ8AtTGl1183pXM2jfX
	 th17EKSHu3po0cTwfR1DqcJsX373bPmPO4wxKCmZX4KhIcwDd1AK92W+6FrjLon8ryVsj
	 GUsbuqwMsRC92KwfgxvsJG2ottTf7pkZqXaBu4PtTydHjr5pMqz87Stkd27VN7dZieA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751280;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=35J45cG94OOD62+cdK1/ryqr1JaqXdQG3Tn3ixfFouQ=;
	b=BAtt4NHoRQKLey88C9jhSJAptCTN9TOocR7IApa7+U9lsGA4SG4hS5hL3743CiMtwnfg
	 qJ96xEYKmZMHCDgrkJrSXK4hGCazTq4JBeD9n66AEdOqeTdLsVNpvSk3BNh0+/rxHyuwg
	 J9KwM05gCaoITOaQgEGdsryrU9riggvIWv/TDYr8OXwhToeyNv7dBxjbmSVZBt9U/f2/N
	 WOuU93iOLGUSg6085BRR5nio3T2vNOwj0kgJpbtHt44IDB2BQyRlrtZ/dF6GFk/KpOtwq
	 TcAMqL2Uxw4XC8uykvdM3cnDqc7SXf35SFBFUXwLsj4Fy7NN5yszSDg0M5rocj/Ja6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=il56kfT7;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6F7606A31F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 10:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A6F7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=il56kfT7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=35J4
	5cG94OOD62+cdK1/ryqr1JaqXdQG3Tn3ixfFouQ=; b=il56kfT7Z7Dm3ew7sjn1
	h+k3m7Bvl5HLq/Qj1yHbnt4E5ALQYYVxdBFRohyxRS9meJTAUc/ldl+VE/TINNZ/
	D8pcvxN8RDdDVyL/uxbvPUvU0BJ5H16PXwPxHl5+YmZWLJVqc7la9aNGCb7pVxav
	mHThwnPAw/YMu9Ac36wfk0xlKZLpMxFsbne5VB228SLG4MaiXe3VJe2IaRbnEm3b
	yXVsDfbb/KDSKLd4GO/Rp9/VvzXPllWsUWn33gSdgPZLEgx+4NyeSfxy/HcZCV7x
	+jNzOPSplrNT5oX2lO3SiukLs8559RXedErqHiQ4VQevSFdRn9PJCYKLbMUoVy/C
	vg==
Received: (qmail 1512198 invoked from network); 23 Oct 2026 12:27:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2026 12:27:56 +0200
X-UD-Smtp-Session: l3s3148p1@Rbb2bn9ewNgujnv2
Date: Fri, 23 Oct 2026 12:27:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/8] i3c: renesas: Drop comma after OF match table
 sentinel
Message-ID: <ats2qwNekJgw5nbi@shikoro>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-2-30a47f25e515@renesas.com>
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
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-2-30a47f25e515@renesas.com>

On Tue, Oct 20, 2026 at 10:14:56AM +0100, Diogo Ivo wrote:
> Drop the unnecessary terminator comma on the compatible table.
> No functional changes intended.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

