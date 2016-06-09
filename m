Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [RESEND PATCH 0/2] arm64: dts: r8a7795: Add FCPF and FDP1 device nodes
Date: Thu,  9 Jun 2016 17:56:56 +0100
Message-Id: <1465491418-32752-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

Appologies for the resend, I very cleverly sent this cover letter detailing the
dependencies only to my e-mail address. And I already know the dependencies!

Following two patches are the same, sorry for the noise.

These are dependent upon the FCP bindings from Laurent [0], and the FCPF
update to those bindings from me [1], and of course the bindings for the
FDP1 [2] which are all posted separately.

[0] http://www.spinics.net/lists/devicetree/msg123968.html
[1] https://lkml.org/lkml/2016/6/9/291
[2] https://lkml.org/lkml/2016/6/9/294

Kieran Bingham (2):
  arm64: dts: r8a7795: add FCPF device nodes
  arm64: dts: r8a7795: add FDP1 device nodes

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

-- 
2.7.4
