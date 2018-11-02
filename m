Return-Path: <devicetree-owner@vger.kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: adv748x: make data-lanes property mandatory for CSI-2 endpoints
Date: Fri,  2 Nov 2018 17:00:06 +0100
Message-Id: <20181102160009.17267-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20181102160009.17267-1-niklas.soderlund+renesas@ragnatech.se>
References: <20181102160009.17267-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The CSI-2 transmitters can use a different number of lanes to transmit
data. Make the data-lanes mandatory for the endpoints that describe the
transmitters as no good default can be set to fallback on.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

---
* Changes since v2
- Update paragraph according to Laurents comments.
---
 Documentation/devicetree/bindings/media/i2c/adv748x.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
index 5dddc95f9cc46084..bffbabc879efd86c 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
@@ -48,7 +48,9 @@ are numbered as follows.
 	  TXA		source		10
 	  TXB		source		11
 
-The digital output port nodes must contain at least one endpoint.
+The digital output port nodes, when present, shall contain at least one
+endpoint. Each of those endpoints shall contain the data-lanes property as
+described in video-interfaces.txt.
 
 Ports are optional if they are not connected to anything at the hardware level.
 
-- 
2.19.1
