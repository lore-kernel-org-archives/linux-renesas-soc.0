Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487186;
	b=N8mB1Ew4ua6qYg8pKhssnJ0fYwE81TeRZTm3Gq4Wxea70RQzZcQWeDh0uMOxu2u/EQS6
	 El62Cywj2WMpX7WPsso0lLDqs9CRl+8x6dTDK1JuREN4AUlsGsmA8ZfN6G/zKaVOJwHMj
	 szfyNK0BoRru6xQ+Xs5XEBDZvIXzOKVjn8tYnUruXLZ2aaWnpWyUwD7zEdzoT6lWLD1L3
	 h+tgR1cKYrt4OoCT29HjYn+dRmSgVwQTsNOJdz6ABToaXsdxEOKrz8Exutg6p8mmr9I6w
	 CGtdr0Q6fnQAPf5pnjB9ZBrkxo8a9S44iAUOGFRqbvs9V9rIenkJhfcI37UxMfwda6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487186;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=p9Meye8EdomVgGo7ib0+5Twh3gdkb8XAbFKswpS/dAA=;
	b=V6L77LxmIW2NaJ8R8aRU8U7quX7aQlW7NFKO52fEcwtr51CvCzPkv45ZNveiiXxbgm/l
	 l7MfNzvgQjg5yTRcCsfdJK+Aiepl3hRZP1/o94/jnl1zyJFDX4oZrhbXVnRkH3WFA1onL
	 Q6lqzwMLKpkZc4nVwlkCCQQvuOa0DGRSmdUHLn7/umG2xU6qMGspBUKPGIqV197Qnvp5i
	 LhdmgAS3ukoA3/4gn/V4RL2Ggc/BhQb72RxikrMEwMp0j+lEfLf9kJaVNmzrvzEvV3FCT
	 sEMqzMH0PkoTMOV0OirQNcGNstBuGxCuowdT6V2k0+NVy6QFMQ+ya+g1SA/32fcmMeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKM51Ptb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA737606A686;
	Tue, 24 Nov 2026 02:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKM51Ptb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381431F000C0;
	Tue, 24 Nov 2026 02:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487186;
	bh=p9Meye8EdomVgGo7ib0+5Twh3gdkb8XAbFKswpS/dAA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QKM51PtbHVOfJUC5lAEw515T3RPXG4Pt/qEsW9pEjw5PEBp3vKBVPV4WBamVWlI3T
	 kqh74m/0an1nGp0uvEdD5o6qtm6Bx+5UCvn6Mb3vQr5Mnnaf9aZyNiFXCEg1Cc/If0
	 XsuDH97EU2rtCkPAMPtUXmzN410iOlYjH/F8ivdlENz4edTyQSLQqqxdvYS+PK+ick
	 KYAUQH2AwbTknmB1S/3PWe30IRD9hsNqXbZaKZLxYLajAPJJqx2ayRROLh9od0HLLh
	 i0tgtitUSzZ6Th13PMXapWLUjPK28r/X7xGc53fwJpjMHGKc/cRvkWqDPeRSj+GKsz
	 SEGyDbBIiSmnA==
Subject: Re: [PATCH net-next v5 08/24] net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT
 write mode encoding
From: netdev-bot+sashiko@kernel.org
To: prabhakar.csengg@gmail.com
Cc: clement.leger@linux.dev, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hkallweit1@gmail.com, linux@armlinux.org.uk, horms@kernel.org,
 p.zabel@pengutronix.de, geert+renesas@glider.be, magnus.damm@gmail.com,
 f.fainelli@gmail.com, ralph.siemsen@linaro.org,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, prabhakar.csengg+renesas@gmail.com,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com
Date: Tue, 24 Nov 2026 02:26:24 +0000
Message-ID: <179548718477.3135.6592520355111834808@kernel.org>
In-Reply-To: <20261120002549.1908299-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message for "net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT
  write mode encoding" carries Fixes: and Cc: stable, but it only…
- [Low] "net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT write mode encoding"
  fixes code from 5edf246c6869 ("net: dsa: rzn1-a5psw: add FDB…

--

net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT write mode encoding

This patch changes the three writes to A5PSW_LK_LEARNCOUNT in
a5psw_setup(), a5psw_port_fdb_add() and a5psw_port_fdb_del() to use
FIELD_PREP() with A5PSW_LK_LEARNCOUNT_MODE. Before this change, the raw
mode values were written into the count field instead of bits [31:30].

> The LK_LEARNCOUNT write mode lives in bits [31:30] of the register, but
> the driver writes the raw A5PSW_LK_LEARNCOUNT_MODE_* values (0, 1, 2)
> directly. As a result, adding an FDB entry writes "set LEARNCOUNT to 1"
> and deleting one writes "set LEARNCOUNT to 2", instead of atomically
> incrementing/decrementing the counter.

[Severity: Low]
The FIELD_PREP() conversion looks correct. Could the commit message also
say what a user sees go wrong because of the bad counter value?

As far as I can tell, the driver never reads A5PSW_LK_LEARNCOUNT back.
It is also not exposed through ethtool, devlink or debugfs. The only
accesses are the three writes in a5psw_setup(), a5psw_port_fdb_add() and
a5psw_port_fdb_del().

That means the bug only matters if the switch hardware itself acts on
LEARNCOUNT, for example as a learning limit or to decide that the lookup
table is full.

Since the patch carries Fixes: and Cc: stable, would it help to describe
that hardware effect? Stable backporters could then tell whether this is
a functional problem or just a wrong value in a counter nothing uses.

> Fixes: 5edf246c6869 ("net: dsa: rzn1-a5psw: add FDB support")
> Cc: stable@vger.kernel.org

[Severity: Low]
This isn't a bug, but should this patch go to net as a separate
submission instead of being part of this series?

The changelog says "v4->v5: New patch", so it was added to the
RZ/T2H/RZ/N2H ETHSW enablement series. That series looks like net-next
material: a new DSA tag protocol, DT bindings, PCS SWCTRL speed
selection and OF data refactoring.

This change only touches existing RZ/N1 code in a5psw_port_fdb_add(),
a5psw_port_fdb_del() and a5psw_setup(). It doesn't depend on any earlier
patch in the series.

The same seems to apply to the other fixes in the series: "Fix
VLANTransmitted counter offset", "Fix MDIO clock divider calculation"
and "Set driver data in probe".

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120002549.1908299-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
