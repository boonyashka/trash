fun getElementValuesByAttributeNameAndAttributeValue(doc: Document, attributeValue: String, attributeName: String): List<String> {
    val xpFactory = XPathFactory.newInstance()
    val xPath = xpFactory.newXPath()
 
    //<item type="T1" count="1">Value1</item>
    val xpath = "/ItemSet/Item[contains(@$attributeName, '$attributeValue')]"
 
    val itemsTypeT1 = xPath.evaluate(xpath, doc, XPathConstants.NODESET) as NodeList
}