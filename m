Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618548;
	b=o8RY75EB/Jv16LsdN94R9xzYkKpAFai41dHDmeoC9qVueWbvEGViwt/o+gi2B02vYfI8
	 HREnS+mJy27TWDHqiEFt7lVNewfTM9Wysjq+7F2OLBGmv1ZMHASgC+7i6DzHT8Sa6+LgU
	 GQqyam93kiEIhqDR5TN0K85Wr3QtS3izLd4Tp87u658QZgQIW4UBTHCAQ44fRVw75Twk8
	 h+xORswEQyOaDExLY7MD12Bd4pohszVTZXHg6+7dVy8V6/BFVricQr1bkmXTd6Kh66qrk
	 fdo11BmClwv2bkK5a7PqDIAbTYOgVyrPwOmLwIF1E/kNO5ZjonO4zCiN1t20naSW4vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618548;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=ihp3wtDmkMTGAaetu4/3iNCVgzuqUfNtgCb+oDeL7S8=;
	b=xIs/6b2Xf81UfiuF9z6BV3l3zyqucEJYyRyAoHrrO4c1fpxU8VNwsN8BoaJmzXVxiIIt
	 Dpq9r5O2FLhod+Lk6i/6+jb7fiRnAg4JDG+M5S2HNhqEqiUOk1zrOv/Lna7F6cTXveSDO
	 yS9KBXz97agElByWq5EISU90ZBqF+aQnlp02VRcH9rrEy4TVkXmNc1bQ6Jgd64Wfoi+7a
	 WTKMGU5XfdsjP7gLI6OTAx9L7cWHC05kuAGR1bWVNj37hOSCLmPGV0oRgXifNfZDRAsJQ
	 HHZLxgEU0RcDHvI7i1rHip6S9p1YYhpFpswmg/lk7f3/VsyjqwVikH7bkZri1GIg94w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=glider.be;
	spf=pass smtp.mailfrom=glider.be;
	dkim=pass header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=JsywVhe8;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ec6sJCLA;
	arc=none smtp.remote-ip=103.168.172.142
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E314F606A323
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E314F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glider.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=JsywVhe8;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ec6sJCLA
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id EA20E13810C6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 09:55:46 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 09:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glider.be; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795618533;
	 x=1795622133; bh=ihp3wtDmkMTGAaetu4/3iNCVgzuqUfNtgCb+oDeL7S8=; b=
	JsywVhe8Z6msiXukg3D4BiZ732DFAjfNCMHwHzxnhnhBgMcwgU+GmjfUyk3vHwIb
	dnPjYeV+DomiaQQoGg8XA4H0NvMFY+ULfwU7j4F+2UDiV3xiYrCBufq3jcyjXGli
	LyR1pL9PUjFPNZiXB4BlwTx9/HwMt05d0L8l9+TkyZsr+ehHJIdm5jwBBNSQ4dD8
	hquQmK2u/y9doI3cmpYk7Pw/90LGLf+ljw29FM4veEmf3DLkmYiPOT+G62e61E70
	rsfqsdOfbmjHFBXjGcXb1a3ZCuTCAjIKkpCKZHm+5/D43woHaBOQQbkXp3DPItG1
	ixaUUWe0jER7et9/CnviZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795618533; x=
	1795622133; bh=ihp3wtDmkMTGAaetu4/3iNCVgzuqUfNtgCb+oDeL7S8=; b=E
	c6sJCLAsS5CZTeUBZooY1RfNRE/6rS2TpBCi3VkzB4gFqE86MoKYg9wjo4IX8ebv
	76FBCE8eW8v87j7BSnp44HKMfA5ZIwAYBX7lgAL95rpA0Bq4ZWctublqjPrYUVWb
	0YPOKluO3J6UJRO232iCqVAQMWWflm4mo/Dw8R0ST8JSDChtp96RhSccKg+MS05n
	zr/d+iWs5ZktorArmSn5k2N/8yRZiqROoKvozEFxHrI+klDIu5VaY9Zz9uzDzdkE
	qCIRugDXwvp6YD1UlkNEdkSVWnwBX4ljMYI/L5raABWcPIeo7BStWqmcqJCC6xSX
	bSJDcuMYBlCrWNAlQiSsQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=glider.be a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795618533; d=glider.be;
	mf=PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:GMqf+tf1XBEUaMQvRfNOCAhye16cypU+4QI5nRTyrMQbPKl
	W44SmOYJuFkEmGuAgxiAPx6m3GX6M+CRoF92/GenTa7TG82OWT0XyoP13oWRqo30
	o/WhWhKr/4E1FthYgBdgNJOalhpAWyG+d4PR+4ll1lLbAhJd7PDwnKVhHBNkQhz7
	cly9WH3IHRQ5jHPtV4LBNdRPkD3666VogI3a0geR/bP2xHYCiq3ATRLfQloIQETA
	9a16WyL+eNVVeaw/V8xUM5h524EzGw9n9zqUv31QVUCWia9Hbk9QPJoAWR3E7JdY
	YH2T3Uip70IS/j0ymJnTLNtZNwXCLf/o8tkbagg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:p5nCobD0aQLEVrz3Sw59BQ/reMp4o7Mba51rKXTu4Zk=:U4fzLuColTqc2Fm/WG9dhOXdiUbyTB0EoMrPkmpF/B0=;
X-ME-Sender: <xms:3fYGaxh0Qh2UmcYE57RPJOjUJS8sDznpR3fCerBHlB5m0yztX6Kmew>
    <xme:3fYGaw3SR9suwAIPfPfiDHXeTSG_x8B-iQMYDvWJYQWS4HfQdrXCRUQw0Y6C4tGf9
    zQxTJudPQOErByyOppWaPeSdzxvhlSwgjvmiEscSwfXAnDDQDfraqA>
X-ME-Proxy-Cause: dmFkZTGr+aIK/sBnvv6jPg3xd7G+76d3IgptFWiBM5tdghM8Xxmntb6wSMertmAyYP1+eg
    vWYCbQdJ+sgXA8MQ9ez36n56XLB1l8ZA9xk6sOafxmmT6o6yowsI7woRtL9bAPURiGXjmY
    Lh5T7nV5kdhOf40AFO4+m4RbZ/Cf7QERSSc7UGa0cgKgo814SYq9P7vw0Ngb1s4ojoMQS9
    QtE9F/R5UDkPWBS70zPa9kVPdG4sqykkdWwi3F9ont+5nKk7LGZPX5BveiRwLsst8riC4n
    p9cJ3FeI2hyXye3+HC1vkcV+KlOIn/n8OCJqsE/3KxKegBxHR2P6BdQnCTBkb5+zr8NKlJ
    RNzY//Duerw/4yWfLUBjUSYp4RGzobwaxqCSsXOuoYhPogmYFWNnIKHVAfDSXjryc3Wxbh
    ElgR5vyhtLFlujNjHgoaacxKvq0lzSvTAcqZujWf7xYjHwUDHGmvJL0pGO6RSa9yxrI7+d
    cYgImjtSaee2+g5E0QIeUmpvP6n9GtD3VySR88trc/CnqJ5HwLx3aa2Knrhqboyb6qfK0m
    q7DJrNgfO1dQo2GdqiPV6zoq4B0e2nU/dV/iPiatb58VWe3M6N0SqI8yCGVy580quaV3OR
    /ojsQtR6cmez2TSiPqzR8yb3V4mvIVY5RfxmEocCxTqGk6pZfylgEHR8Mklg
X-ME-Proxy: <xmx:4fYGazI9zLvXeKmBljWMGIQO6rRtQMLhB4zcONOzYjQJ7UuoYVNogA>
    <xmx:4fYGa4VNLHhYWXpDIFtbK4y_nLAnNE_AwE7Qz4WU7kTWUeJXmj11fg>
    <xmx:4fYGa8Jp2akxx1yU0weow9kQlisGyj4CRDM-AgWR-cfCSL4YM6Z5Xg>
    <xmx:4fYGa1zXud2Lave2wGYs6edoq9nTM6TJ_zsOiDa6f9HkNpkNNxvJ9w>
    <xmx:5fYGa8SJ8sk6EzaG79H354qTHDhU-HZPENbehVRc9uO_FNKgCEP-KLxb>
Feedback-ID: ia0f84a9e:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B92D6F8009C; Wed, 25 Nov 2026 09:55:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AwlvDh2-Hwo3
Date: Wed, 25 Nov 2026 15:55:05 +0100
From: "Geert Uytterhoeven" <geert+renesas@glider.be>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>,
 "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Ulf Hansson" <ulfh@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 "Kevin Hilman" <khilman@baylibre.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 "Paul Elder" <paul.elder+renesas@ideasonboard.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Cristian Marussi" <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Message-Id: <9ae2cb61-a94f-46f0-876b-66142c99c4be@app.fastmail.com>
In-Reply-To: <fc13a7a8-b825-400c-9ea0-ceb2670dc478@baylibre.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
 <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
 <20261123103633.GB2959742@killaraus.ideasonboard.com>
 <fc13a7a8-b825-400c-9ea0-ceb2670dc478@baylibre.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Cl=C4=99ment,

On Mon, Nov 23, 2026, at 16:46, Cl=C3=A9ment Le Goffic wrote:
> On 11/23/26 11:36 AM, Laurent Pinchart wrote:
>>> I know several SDK versions exist, and supporting several of them is=
 work for a vendor tree.
>>> As Geert's cover says, "While upstream Linux must only support suffi=
ciently mature firmware versions, vendor trees (e.g. renesas-lts) may st=
ill want to support development firmware versions".
>>> Each SDK version can then have its own DT there.
>>=20
>> That's not how DT works. Please be gentle with Krzysztof and avoid
>> increasing his blood pressure :-)
>
> These DTs would stay in the vendor tree, so they would not reach Krzys=
ztof :-)
> Upstream would have one SCMI DT, as v5 has one table.

So we can't upstream DT, until we have stable IDs for real?

> I also see technical weaknesses in the remapping:
> It adds a second layer of ids on top of the SCMI ids, so each new=20
> device needs entries in the kernel tables as well as its DT node.

That's not unlike the case with real hardware provider drivers: when a
new device needs a new clock, it needs to be added to the hardware
driver.

And the remapping driver takes care of all other impedance mismatches
between SCMI and the hardware, in a single spot, not distributed across
all individual device drivers.

> And Zephyr already uses the SCMI ids in its DT for this chip, without=20
> such a layer.

Zephyr has less complex software abstractions than Linux, and
might not care about DT stability.

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org

In personal conversations with technical people, I call myself a hacker.=
 But
when I'm talking to journalists I just say "programmer" or something lik=
e that.
                                                            -- Linus Tor=
valds
